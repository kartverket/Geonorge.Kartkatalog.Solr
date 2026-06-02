# V2Api.CollectionsApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**balanceShardUnique**](CollectionsApi.md#balanceShardUnique) | **POST** /collections/{collectionName}/balance-shard-unique | Ensure a specified per-shard property is distributed evenly amongst physical nodes comprising a collection
[**createCollection**](CollectionsApi.md#createCollection) | **POST** /collections | Creates a new SolrCloud collection.
[**deleteCollection**](CollectionsApi.md#deleteCollection) | **DELETE** /collections/{collectionName} | Deletes a collection from SolrCloud
[**getCollectionStatus**](CollectionsApi.md#getCollectionStatus) | **GET** /collections/{collectionName} | Fetches metadata about the specified collection
[**listCollections**](CollectionsApi.md#listCollections) | **GET** /collections | List all collections in this Solr cluster
[**reloadCollection**](CollectionsApi.md#reloadCollection) | **POST** /collections/{collectionName}/reload | Reload all cores in the specified collection.
[**renameCollection**](CollectionsApi.md#renameCollection) | **POST** /collections/{collectionName}/rename | Rename a SolrCloud collection



## balanceShardUnique

> SubResponseAccumulatingJerseyResponse balanceShardUnique(collectionName, opts)

Ensure a specified per-shard property is distributed evenly amongst physical nodes comprising a collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.CollectionsApi();
let collectionName = "collectionName_example"; // String | 
let opts = {
  'balanceShardUniqueRequestBody': new V2Api.BalanceShardUniqueRequestBody() // BalanceShardUniqueRequestBody | 
};
apiInstance.balanceShardUnique(collectionName, opts, (error, data, response) => {
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
 **collectionName** | **String**|  | 
 **balanceShardUniqueRequestBody** | [**BalanceShardUniqueRequestBody**](BalanceShardUniqueRequestBody.md)|  | [optional] 

### Return type

[**SubResponseAccumulatingJerseyResponse**](SubResponseAccumulatingJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## createCollection

> SubResponseAccumulatingJerseyResponse createCollection(opts)

Creates a new SolrCloud collection.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.CollectionsApi();
let opts = {
  'createCollectionRequestBody': new V2Api.CreateCollectionRequestBody() // CreateCollectionRequestBody | 
};
apiInstance.createCollection(opts, (error, data, response) => {
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
 **createCollectionRequestBody** | [**CreateCollectionRequestBody**](CreateCollectionRequestBody.md)|  | [optional] 

### Return type

[**SubResponseAccumulatingJerseyResponse**](SubResponseAccumulatingJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## deleteCollection

> SubResponseAccumulatingJerseyResponse deleteCollection(collectionName, opts)

Deletes a collection from SolrCloud

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.CollectionsApi();
let collectionName = "collectionName_example"; // String | The name of the collection to be deleted.
let opts = {
  'followAliases': true, // Boolean | 
  'async': "async_example" // String | An ID to track the request asynchronously
};
apiInstance.deleteCollection(collectionName, opts, (error, data, response) => {
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
 **collectionName** | **String**| The name of the collection to be deleted. | 
 **followAliases** | **Boolean**|  | [optional] 
 **async** | **String**| An ID to track the request asynchronously | [optional] 

### Return type

[**SubResponseAccumulatingJerseyResponse**](SubResponseAccumulatingJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getCollectionStatus

> CollectionStatusResponse getCollectionStatus(collectionName, opts)

Fetches metadata about the specified collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.CollectionsApi();
let collectionName = "collectionName_example"; // String | The name of the collection return metadata for
let opts = {
  'coreInfo': true, // Boolean | Boolean flag to include metadata (e.g. index an data directories, IndexWriter configuration, etc.) about each shard leader's core
  'segments': true, // Boolean | Boolean flag to include metadata and statistics about the segments used by each shard leader.  Implicitly set to true by 'fieldInfo' and 'sizeInfo'
  'fieldInfo': true, // Boolean | Boolean flag to include statistics about the indexed fields present on each shard leader. Implicitly sets the 'segments' flag to 'true'
  'rawSize': true, // Boolean | Boolean flag to include simple estimates of the disk size taken up by each field (e.g. \"id\", \"_version_\") and by each index data structure (e.g. 'storedFields', 'docValues_numeric').
  'rawSizeSummary': true, // Boolean | Boolean flag to include more involved estimates of the disk size taken up by index data structures, on a per-field basis (e.g. how much data does the \"id\" field contribute to 'storedField' index files).  More detail than 'rawSize', less detail than 'rawSizeDetails'.
  'rawSizeDetails': true, // Boolean | Boolean flag to include detailed statistics about the disk size taken up by various fields and data structures.  More detail than 'rawSize' and 'rawSizeSummary'.
  'rawSizeSamplingPercent': 3.4, // Number | Percentage (between 0 and 100) of data to read when estimating index size and statistics.  Defaults to 5.0 (i.e. 5%).
  'sizeInfo': true // Boolean | Boolean flag to include information about the largest index files for each Lucene segment.. Implicitly sets the 'segment' flag to 'true'
};
apiInstance.getCollectionStatus(collectionName, opts, (error, data, response) => {
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
 **collectionName** | **String**| The name of the collection return metadata for | 
 **coreInfo** | **Boolean**| Boolean flag to include metadata (e.g. index an data directories, IndexWriter configuration, etc.) about each shard leader&#39;s core | [optional] 
 **segments** | **Boolean**| Boolean flag to include metadata and statistics about the segments used by each shard leader.  Implicitly set to true by &#39;fieldInfo&#39; and &#39;sizeInfo&#39; | [optional] 
 **fieldInfo** | **Boolean**| Boolean flag to include statistics about the indexed fields present on each shard leader. Implicitly sets the &#39;segments&#39; flag to &#39;true&#39; | [optional] 
 **rawSize** | **Boolean**| Boolean flag to include simple estimates of the disk size taken up by each field (e.g. \&quot;id\&quot;, \&quot;_version_\&quot;) and by each index data structure (e.g. &#39;storedFields&#39;, &#39;docValues_numeric&#39;). | [optional] 
 **rawSizeSummary** | **Boolean**| Boolean flag to include more involved estimates of the disk size taken up by index data structures, on a per-field basis (e.g. how much data does the \&quot;id\&quot; field contribute to &#39;storedField&#39; index files).  More detail than &#39;rawSize&#39;, less detail than &#39;rawSizeDetails&#39;. | [optional] 
 **rawSizeDetails** | **Boolean**| Boolean flag to include detailed statistics about the disk size taken up by various fields and data structures.  More detail than &#39;rawSize&#39; and &#39;rawSizeSummary&#39;. | [optional] 
 **rawSizeSamplingPercent** | **Number**| Percentage (between 0 and 100) of data to read when estimating index size and statistics.  Defaults to 5.0 (i.e. 5%). | [optional] 
 **sizeInfo** | **Boolean**| Boolean flag to include information about the largest index files for each Lucene segment.. Implicitly sets the &#39;segment&#39; flag to &#39;true&#39; | [optional] 

### Return type

[**CollectionStatusResponse**](CollectionStatusResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listCollections

> ListCollectionsResponse listCollections()

List all collections in this Solr cluster

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.CollectionsApi();
apiInstance.listCollections((error, data, response) => {
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

[**ListCollectionsResponse**](ListCollectionsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## reloadCollection

> SubResponseAccumulatingJerseyResponse reloadCollection(collectionName, opts)

Reload all cores in the specified collection.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.CollectionsApi();
let collectionName = "collectionName_example"; // String | 
let opts = {
  'reloadCollectionRequestBody': new V2Api.ReloadCollectionRequestBody() // ReloadCollectionRequestBody | 
};
apiInstance.reloadCollection(collectionName, opts, (error, data, response) => {
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
 **collectionName** | **String**|  | 
 **reloadCollectionRequestBody** | [**ReloadCollectionRequestBody**](ReloadCollectionRequestBody.md)|  | [optional] 

### Return type

[**SubResponseAccumulatingJerseyResponse**](SubResponseAccumulatingJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## renameCollection

> SubResponseAccumulatingJerseyResponse renameCollection(collectionName, opts)

Rename a SolrCloud collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.CollectionsApi();
let collectionName = "collectionName_example"; // String | 
let opts = {
  'renameCollectionRequestBody': new V2Api.RenameCollectionRequestBody() // RenameCollectionRequestBody | 
};
apiInstance.renameCollection(collectionName, opts, (error, data, response) => {
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
 **collectionName** | **String**|  | 
 **renameCollectionRequestBody** | [**RenameCollectionRequestBody**](RenameCollectionRequestBody.md)|  | [optional] 

### Return type

[**SubResponseAccumulatingJerseyResponse**](SubResponseAccumulatingJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

