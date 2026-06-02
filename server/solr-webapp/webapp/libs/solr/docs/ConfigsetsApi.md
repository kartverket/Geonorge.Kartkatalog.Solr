# V2Api.ConfigsetsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**cloneExistingConfigSet**](ConfigsetsApi.md#cloneExistingConfigSet) | **POST** /configsets | Create a new configset modeled on an existing one.
[**deleteConfigSet**](ConfigsetsApi.md#deleteConfigSet) | **DELETE** /configsets/{configSetName} | Delete an existing configset.
[**listConfigSet**](ConfigsetsApi.md#listConfigSet) | **GET** /configsets | List the configsets available to Solr.
[**uploadConfigSet**](ConfigsetsApi.md#uploadConfigSet) | **PUT** /configsets/{configSetName} | Create a new configset.
[**uploadConfigSetFile**](ConfigsetsApi.md#uploadConfigSetFile) | **PUT** /configsets/{configSetName}/{filePath} | Create a new configset.



## cloneExistingConfigSet

> SolrJerseyResponse cloneExistingConfigSet(opts)

Create a new configset modeled on an existing one.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ConfigsetsApi();
let opts = {
  'cloneConfigsetRequestBody': new V2Api.CloneConfigsetRequestBody() // CloneConfigsetRequestBody | 
};
apiInstance.cloneExistingConfigSet(opts, (error, data, response) => {
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
 **cloneConfigsetRequestBody** | [**CloneConfigsetRequestBody**](CloneConfigsetRequestBody.md)|  | [optional] 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## deleteConfigSet

> SolrJerseyResponse deleteConfigSet(configSetName)

Delete an existing configset.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ConfigsetsApi();
let configSetName = "configSetName_example"; // String | 
apiInstance.deleteConfigSet(configSetName, (error, data, response) => {
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
 **configSetName** | **String**|  | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listConfigSet

> ListConfigsetsResponse listConfigSet()

List the configsets available to Solr.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ConfigsetsApi();
apiInstance.listConfigSet((error, data, response) => {
  if (error) {
    console.error(error);
  } else {
    console.log('API called successfully. Returned data: ' + data);
  }
});
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**ListConfigsetsResponse**](ListConfigsetsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## uploadConfigSet

> SolrJerseyResponse uploadConfigSet(configSetName, body, opts)

Create a new configset.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ConfigsetsApi();
let configSetName = "configSetName_example"; // String | 
let body = {key: null}; // Object | 
let opts = {
  'overwrite': true, // Boolean | 
  'cleanup': true // Boolean | 
};
apiInstance.uploadConfigSet(configSetName, body, opts, (error, data, response) => {
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
 **configSetName** | **String**|  | 
 **body** | **Object**|  | 
 **overwrite** | **Boolean**|  | [optional] 
 **cleanup** | **Boolean**|  | [optional] 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## uploadConfigSetFile

> SolrJerseyResponse uploadConfigSetFile(configSetName, filePath, body, opts)

Create a new configset.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ConfigsetsApi();
let configSetName = "configSetName_example"; // String | 
let filePath = "filePath_example"; // String | 
let body = {key: null}; // Object | 
let opts = {
  'overwrite': true, // Boolean | 
  'cleanup': true // Boolean | 
};
apiInstance.uploadConfigSetFile(configSetName, filePath, body, opts, (error, data, response) => {
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
 **configSetName** | **String**|  | 
 **filePath** | **String**|  | 
 **body** | **Object**|  | 
 **overwrite** | **Boolean**|  | [optional] 
 **cleanup** | **Boolean**|  | [optional] 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

