# V2Api.ClusterPropertiesApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createOrUpdateClusterProperty**](ClusterPropertiesApi.md#createOrUpdateClusterProperty) | **PUT** /cluster/properties/{propertyName} | Set a single new or existing cluster property in this Solr cluster.
[**createOrUpdateNestedClusterProperty**](ClusterPropertiesApi.md#createOrUpdateNestedClusterProperty) | **PUT** /cluster/properties | Set nested cluster properties in this Solr cluster.
[**deleteClusterProperty**](ClusterPropertiesApi.md#deleteClusterProperty) | **DELETE** /cluster/properties/{propertyName} | Delete a cluster property in this Solr cluster.
[**getClusterProperty**](ClusterPropertiesApi.md#getClusterProperty) | **GET** /cluster/properties/{propertyName} | Get a cluster property in this Solr cluster.
[**listClusterProperties**](ClusterPropertiesApi.md#listClusterProperties) | **GET** /cluster/properties | List all cluster properties in this Solr cluster.



## createOrUpdateClusterProperty

> SolrJerseyResponse createOrUpdateClusterProperty(propertyName, setClusterPropertyRequestBody)

Set a single new or existing cluster property in this Solr cluster.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ClusterPropertiesApi();
let propertyName = "propertyName_example"; // String | The name of the property being set.
let setClusterPropertyRequestBody = new V2Api.SetClusterPropertyRequestBody(); // SetClusterPropertyRequestBody | Value to set for the property
apiInstance.createOrUpdateClusterProperty(propertyName, setClusterPropertyRequestBody, (error, data, response) => {
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
 **propertyName** | **String**| The name of the property being set. | 
 **setClusterPropertyRequestBody** | [**SetClusterPropertyRequestBody**](SetClusterPropertyRequestBody.md)| Value to set for the property | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## createOrUpdateNestedClusterProperty

> SolrJerseyResponse createOrUpdateNestedClusterProperty(requestBody)

Set nested cluster properties in this Solr cluster.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ClusterPropertiesApi();
let requestBody = {key: null}; // {String: Object} | Property/ies to be set
apiInstance.createOrUpdateNestedClusterProperty(requestBody, (error, data, response) => {
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
 **requestBody** | [**{String: Object}**](Object.md)| Property/ies to be set | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## deleteClusterProperty

> SolrJerseyResponse deleteClusterProperty(propertyName)

Delete a cluster property in this Solr cluster.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ClusterPropertiesApi();
let propertyName = "propertyName_example"; // String | The name of the property being deleted.
apiInstance.deleteClusterProperty(propertyName, (error, data, response) => {
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
 **propertyName** | **String**| The name of the property being deleted. | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getClusterProperty

> SolrJerseyResponse getClusterProperty(propertyName)

Get a cluster property in this Solr cluster.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ClusterPropertiesApi();
let propertyName = "propertyName_example"; // String | The name of the property being retrieved.
apiInstance.getClusterProperty(propertyName, (error, data, response) => {
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
 **propertyName** | **String**| The name of the property being retrieved. | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listClusterProperties

> ListClusterPropertiesResponse listClusterProperties()

List all cluster properties in this Solr cluster.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ClusterPropertiesApi();
apiInstance.listClusterProperties((error, data, response) => {
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

[**ListClusterPropertiesResponse**](ListClusterPropertiesResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

