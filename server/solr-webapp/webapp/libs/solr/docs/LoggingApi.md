# V2Api.LoggingApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**fetchLocalLogMessages**](LoggingApi.md#fetchLocalLogMessages) | **GET** /node/logging/messages | Fetch recent log messages on the targeted node.
[**listAllLoggersAndLevels**](LoggingApi.md#listAllLoggersAndLevels) | **GET** /node/logging/levels | List all log-levels for the target node.
[**modifyLocalLogLevel**](LoggingApi.md#modifyLocalLogLevel) | **PUT** /node/logging/levels | Set one or more logger levels on the target node.
[**setMessageThreshold**](LoggingApi.md#setMessageThreshold) | **PUT** /node/logging/messages/threshold | Set a threshold level for the targeted node&#39;s log message watcher.



## fetchLocalLogMessages

> LogMessagesResponse fetchLocalLogMessages(opts)

Fetch recent log messages on the targeted node.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.LoggingApi();
let opts = {
  'since': 789 // Number | 
};
apiInstance.fetchLocalLogMessages(opts, (error, data, response) => {
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
 **since** | **Number**|  | [optional] 

### Return type

[**LogMessagesResponse**](LogMessagesResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listAllLoggersAndLevels

> ListLevelsResponse listAllLoggersAndLevels()

List all log-levels for the target node.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.LoggingApi();
apiInstance.listAllLoggersAndLevels((error, data, response) => {
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

[**ListLevelsResponse**](ListLevelsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## modifyLocalLogLevel

> LoggingResponse modifyLocalLogLevel(opts)

Set one or more logger levels on the target node.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.LoggingApi();
let opts = {
  'logLevelChange': [new V2Api.LogLevelChange()] // [LogLevelChange] | 
};
apiInstance.modifyLocalLogLevel(opts, (error, data, response) => {
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
 **logLevelChange** | [**[LogLevelChange]**](LogLevelChange.md)|  | [optional] 

### Return type

[**LoggingResponse**](LoggingResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## setMessageThreshold

> LoggingResponse setMessageThreshold(opts)

Set a threshold level for the targeted node&#39;s log message watcher.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.LoggingApi();
let opts = {
  'setThresholdRequestBody': new V2Api.SetThresholdRequestBody() // SetThresholdRequestBody | 
};
apiInstance.setMessageThreshold(opts, (error, data, response) => {
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
 **setThresholdRequestBody** | [**SetThresholdRequestBody**](SetThresholdRequestBody.md)|  | [optional] 

### Return type

[**LoggingResponse**](LoggingResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

