# V2Api.ReplicationBackupsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createBackup1**](ReplicationBackupsApi.md#createBackup1) | **POST** /cores/{coreName}/replication/backups | Create a backup of a single core using Solr&#39;s &#39;Replication Handler&#39;



## createBackup1

> ReplicationBackupResponse createBackup1(coreName)

Create a backup of a single core using Solr&#39;s &#39;Replication Handler&#39;

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ReplicationBackupsApi();
let coreName = "coreName_example"; // String | 
apiInstance.createBackup1(coreName, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coreName** | **String**|  | 

### Return type

[**ReplicationBackupResponse**](ReplicationBackupResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

