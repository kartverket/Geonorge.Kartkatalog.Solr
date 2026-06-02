# V2Api.SegmentsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**getSegmentData**](SegmentsApi.md#getSegmentData) | **GET** /cores/{coreName}/segments | Fetches metadata about the segments in use by the specified core



## getSegmentData

> GetSegmentDataResponse getSegmentData(coreName, opts)

Fetches metadata about the segments in use by the specified core

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SegmentsApi();
let coreName = "coreName_example"; // String | 
let opts = {
  'coreInfo': true, // Boolean | Boolean flag to include metadata (e.g. index an data directories, IndexWriter configuration, etc.) about each shard leader's core
  'fieldInfo': true, // Boolean | Boolean flag to include statistics about the indexed fields present on each shard leader.
  'rawSize': true, // Boolean | Boolean flag to include simple estimates of the disk size taken up by each field (e.g. \"id\", \"_version_\") and by each index data structure (e.g. 'storedFields', 'docValues_numeric').
  'rawSizeSummary': true, // Boolean | Boolean flag to include more involved estimates of the disk size taken up by index data structures, on a per-field basis (e.g. how much data does the \"id\" field contribute to 'storedField' index files).  More detail than 'rawSize', less detail than 'rawSizeDetails'.
  'rawSizeDetails': true, // Boolean | Boolean flag to include detailed statistics about the disk size taken up by various fields and data structures.  More detail than 'rawSize' and 'rawSizeSummary'.
  'rawSizeSamplingPercent': 3.4, // Number | Percentage (between 0 and 100) of data to read when estimating index size and statistics.  Defaults to 5.0 (i.e. 5%).
  'sizeInfo': true // Boolean | Boolean flag to include information about the largest index files for each Lucene segment.
};
apiInstance.getSegmentData(coreName, opts, (error, data, response) => {
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
 **coreInfo** | **Boolean**| Boolean flag to include metadata (e.g. index an data directories, IndexWriter configuration, etc.) about each shard leader&#39;s core | [optional] 
 **fieldInfo** | **Boolean**| Boolean flag to include statistics about the indexed fields present on each shard leader. | [optional] 
 **rawSize** | **Boolean**| Boolean flag to include simple estimates of the disk size taken up by each field (e.g. \&quot;id\&quot;, \&quot;_version_\&quot;) and by each index data structure (e.g. &#39;storedFields&#39;, &#39;docValues_numeric&#39;). | [optional] 
 **rawSizeSummary** | **Boolean**| Boolean flag to include more involved estimates of the disk size taken up by index data structures, on a per-field basis (e.g. how much data does the \&quot;id\&quot; field contribute to &#39;storedField&#39; index files).  More detail than &#39;rawSize&#39;, less detail than &#39;rawSizeDetails&#39;. | [optional] 
 **rawSizeDetails** | **Boolean**| Boolean flag to include detailed statistics about the disk size taken up by various fields and data structures.  More detail than &#39;rawSize&#39; and &#39;rawSizeSummary&#39;. | [optional] 
 **rawSizeSamplingPercent** | **Number**| Percentage (between 0 and 100) of data to read when estimating index size and statistics.  Defaults to 5.0 (i.e. 5%). | [optional] 
 **sizeInfo** | **Boolean**| Boolean flag to include information about the largest index files for each Lucene segment. | [optional] 

### Return type

[**GetSegmentDataResponse**](GetSegmentDataResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

