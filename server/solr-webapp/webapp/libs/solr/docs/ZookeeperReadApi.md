# V2Api.ZookeeperReadApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**listNodes**](ZookeeperReadApi.md#listNodes) | **GET** /cluster/zookeeper/children{zkPath} | List and stat all children of a specified ZooKeeper node
[**readNode**](ZookeeperReadApi.md#readNode) | **GET** /cluster/zookeeper/data{zkPath} | Return the data stored in a specified ZooKeeper node



## listNodes

> ZooKeeperListChildrenResponse listNodes(zkPath, opts)

List and stat all children of a specified ZooKeeper node

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ZookeeperReadApi();
let zkPath = "zkPath_example"; // String | The path of the ZooKeeper node to stat and list children of
let opts = {
  'children': true // Boolean | Controls whether stat information for child nodes is included in the response. 'true' by default.
};
apiInstance.listNodes(zkPath, opts, (error, data, response) => {
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
 **zkPath** | **String**| The path of the ZooKeeper node to stat and list children of | 
 **children** | **Boolean**| Controls whether stat information for child nodes is included in the response. &#39;true&#39; by default. | [optional] 

### Return type

[**ZooKeeperListChildrenResponse**](ZooKeeperListChildrenResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json, application/javabin


## readNode

> readNode(zkPath)

Return the data stored in a specified ZooKeeper node

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.ZookeeperReadApi();
let zkPath = "zkPath_example"; // String | The path of the node to read from ZooKeeper
apiInstance.readNode(zkPath, (error, data, response) => {
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
 **zkPath** | **String**| The path of the node to read from ZooKeeper | 

### Return type

null (empty response body)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/vnd.apache.solr.raw, application/json

