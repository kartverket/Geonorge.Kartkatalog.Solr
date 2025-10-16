# Function to update organizations field for metadata_all core
# Run powershell as administrator
# use command: Set-ExecutionPolicy RemoteSigned
# Run script: .\updateOrganizations.ps1

# Set encoding for proper handling of Norwegian characters
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

function Update-MetadataAllOrganizations {
    param(
        [string]$SolrUrl = "http://localhost:8983/solr",
        [string]$BatchSize = 20
    )
    
    $CoreName = "metadata_all"
    Write-Host "Processing core: $CoreName"
    
    # Use cursor for large datasets
    $cursorMark = "*"
    $allDocs = @()
    
    do {
        # URL encode the cursor mark for proper handling
        $encodedCursorMark = [System.Uri]::EscapeDataString($cursorMark)
        
        # Get documents in batches using cursor
        $getUrl = "$SolrUrl/$CoreName/select?q=organization:[* TO *]&fl=uuid,organization&rows=$BatchSize&wt=json&sort=uuid asc&cursorMark=$encodedCursorMark"
        Write-Host "Retrieving documents with URL: $getUrl"
        Write-Host "Current cursor mark: $cursorMark" -ForegroundColor Cyan
        
        try {
            $response = Invoke-RestMethod -Uri $getUrl -Method Get
            $docs = $response.response.docs
            $allDocs += $docs
            
            # Store the previous cursor mark for comparison
            $previousCursorMark = $cursorMark
            $cursorMark = $response.nextCursorMark
            
            Write-Host "Retrieved $($docs.Count) documents (Total: $($allDocs.Count))"
            Write-Host "Next cursor mark: $cursorMark" -ForegroundColor Cyan
            
        } catch {
            Write-Error "Error retrieving documents: $($_.Exception.Message)"
            break
        }
        
    } while ($cursorMark -ne $previousCursorMark -and $docs.Count -gt 0)
    
    if ($allDocs.Count -eq 0) {
        Write-Host "No documents found with organization field in $CoreName"
        return
    }
    
    Write-Host "Found $($allDocs.Count) total documents to process in $CoreName"
    
    # Process documents in batches for updates
    $updateBatchSize = 10
    $totalUpdated = 0
    
    for ($i = 0; $i -lt $allDocs.Count; $i += $updateBatchSize) {
        $batch = $allDocs[$i..([Math]::Min($i + $updateBatchSize - 1, $allDocs.Count - 1))]
        
        # Create update commands for this batch
        $updateDocs = @()
        foreach ($doc in $batch) {
            if ($doc.organization -and $doc.organization.Trim() -ne "") {
                $updateDoc = @{
                    uuid = $doc.uuid
                    organizations = @{ 
                        set = @($doc.organization) 
                    }
                }
                $updateDocs += $updateDoc
            }
        }
        
        if ($updateDocs.Count -gt 0) {
            try {
                # Convert to JSON with proper encoding
                $json = $updateDocs | ConvertTo-Json -Depth 4
                $utf8Bytes = [System.Text.Encoding]::UTF8.GetBytes($json)
                $headers = @{ 
                    "Content-Type" = "application/json; charset=utf-8"
                }
                
                # Send update request with UTF-8 encoded body
                $updateUrl = "$SolrUrl/$CoreName/update"
                $updateResponse = Invoke-RestMethod -Uri $updateUrl -Method Post -Body $utf8Bytes -Headers $headers
                $totalUpdated += $updateDocs.Count
                Write-Host "Updated batch: $($updateDocs.Count) documents (Total updated: $totalUpdated)"
                
            } catch {
                Write-Host "Error updating batch:" -ForegroundColor Red
                Write-Host "Exception Message: $($_.Exception.Message)" -ForegroundColor Red
                
                # Capture detailed error response if available
                if ($_.Exception.Response) {
                    $statusCode = $_.Exception.Response.StatusCode
                    $statusDescription = $_.Exception.Response.StatusDescription
                    Write-Host "HTTP Status: $statusCode - $statusDescription" -ForegroundColor Red
                    
                    # Try to read the response content
                    try {
                        $responseStream = $_.Exception.Response.GetResponseStream()
                        $reader = New-Object System.IO.StreamReader($responseStream)
                        $responseContent = $reader.ReadToEnd()
                        Write-Host "Response Content: $responseContent" -ForegroundColor Red
                        $reader.Close()
                        $responseStream.Close()
                    } catch {
                        Write-Host "Could not read response content: $($_.Exception.Message)" -ForegroundColor Red
                    }
                }
                
                # Also log the JSON that failed
                Write-Host "Failed JSON payload (first 50000 chars):" -ForegroundColor Yellow
                Write-Host $json.Substring(0, [Math]::Min(50000, $json.Length)) -ForegroundColor Yellow
            }
        }
    }
    
    # Commit the changes
    try {
        $commitUrl = "$SolrUrl/$CoreName/update?commit=true"
        Invoke-RestMethod -Uri $commitUrl -Method Post
        Write-Host "Successfully committed $totalUpdated documents in $CoreName core"
    } catch {
        Write-Error "Error committing changes: $($_.Exception.Message)"
    }
}

# Execute the update
Update-MetadataAllOrganizations

Write-Host "Bulk update completed for metadata_all core!"