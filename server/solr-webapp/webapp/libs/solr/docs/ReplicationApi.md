# V2Api.ReplicationApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**fetchFile1**](ReplicationApi.md#fetchFile1) | **GET** /cores/{coreName}/replication/files/{filePath} | Get a stream of a specific file path of a core
[**fetchFileList**](ReplicationApi.md#fetchFileList) | **GET** /cores/{coreName}/replication/files | Return the list of index file that make up the specified core.
[**fetchIndexVersion**](ReplicationApi.md#fetchIndexVersion) | **GET** /cores/{coreName}/replication/indexversion | Return the index version of the specified core.



## fetchFile1

> fetchFile1(coreName, filePath, dirType, opts)

Get a stream of a specific file path of a core

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ReplicationApi();
let coreName = "coreName_example"; // String | 
let filePath = "filePath_example"; // String | 
let dirType = "dirType_example"; // String | Directory type for specific filePath (cf or tlogFile). Defaults to Lucene index (file) directory if empty
let opts = {
  'offset': "offset_example", // String | Output stream read/write offset
  'len': "len_example", // String | 
  'compression': false, // Boolean | Compress file output
  'checksum': false, // Boolean | Write checksum with output stream
  'maxWriteMBPerSec': 3.4, // Number | Limit data write per seconds. Defaults to no throttling
  'generation': 789 // Number | The generation number of the index
};
apiInstance.fetchFile1(coreName, filePath, dirType, opts, (error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully.');
  }
});
```

### Parameters


Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **coreName** | **String**|  | 
 **filePath** | **String**|  | 
 **dirType** | **String**| Directory type for specific filePath (cf or tlogFile). Defaults to Lucene index (file) directory if empty | 
 **offset** | **String**| Output stream read/write offset | [optional] 
 **len** | **String**|  | [optional] 
 **compression** | **Boolean**| Compress file output | [optional] [default to false]
 **checksum** | **Boolean**| Write checksum with output stream | [optional] [default to false]
 **maxWriteMBPerSec** | **Number**| Limit data write per seconds. Defaults to no throttling | [optional] 
 **generation** | **Number**| The generation number of the index | [optional] 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## fetchFileList

> FileListResponse fetchFileList(coreName, generation)

Return the list of index file that make up the specified core.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ReplicationApi();
let coreName = "coreName_example"; // String | 
let generation = 789; // Number | The generation number of the index
apiInstance.fetchFileList(coreName, generation, (error, data, response) => {
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
 **generation** | **Number**| The generation number of the index | 

### Return type

[**FileListResponse**](FileListResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## fetchIndexVersion

> IndexVersionResponse fetchIndexVersion(coreName)

Return the index version of the specified core.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ReplicationApi();
let coreName = "coreName_example"; // String | 
apiInstance.fetchIndexVersion(coreName, (error, data, response) => {
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

[**IndexVersionResponse**](IndexVersionResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

