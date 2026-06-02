# V2Api.SchemaApi

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**addDynamicField**](SchemaApi.md#addDynamicField) | **PUT** /{indexType}/{indexName}/schema/dynamicfields/{dynamicFieldName} | Create a new dynamic field with the specified name.
[**addField**](SchemaApi.md#addField) | **PUT** /{indexType}/{indexName}/schema/fields/{fieldName} | Add a standard (i.e. non-dynamic) field with the specified name.
[**addFieldType**](SchemaApi.md#addFieldType) | **PUT** /{indexType}/{indexName}/schema/fieldtypes/{fieldTypeName} | Add a new field-type with the specified name.
[**bulkSchemaModification**](SchemaApi.md#bulkSchemaModification) | **POST** /{indexType}/{indexName}/schema/bulk | Perform the specified schema modifications.
[**deleteDynamicField**](SchemaApi.md#deleteDynamicField) | **DELETE** /{indexType}/{indexName}/schema/dynamicfields/{dynamicFieldName} | Remove the dynamic field with the specified name.
[**deleteField**](SchemaApi.md#deleteField) | **DELETE** /{indexType}/{indexName}/schema/fields/{fieldName} | Remove the non-dynamic field with the specified name.
[**deleteFieldType**](SchemaApi.md#deleteFieldType) | **DELETE** /{indexType}/{indexName}/schema/fieldtypes/{fieldTypeName} | Remove the field type with the specified name.
[**getDynamicFieldInfo**](SchemaApi.md#getDynamicFieldInfo) | **GET** /{indexType}/{indexName}/schema/dynamicfields/{fieldName} | Get detailed info about a single dynamic field
[**getFieldInfo**](SchemaApi.md#getFieldInfo) | **GET** /{indexType}/{indexName}/schema/fields/{fieldName} | Get detailed info about a single non-dynamic field
[**getFieldTypeInfo**](SchemaApi.md#getFieldTypeInfo) | **GET** /{indexType}/{indexName}/schema/fieldtypes/{fieldTypeName} | Get detailed info about a single field type
[**getSchemaInfo**](SchemaApi.md#getSchemaInfo) | **GET** /{indexType}/{indexName}/schema | Fetch the entire schema of the specified core or collection
[**getSchemaName**](SchemaApi.md#getSchemaName) | **GET** /{indexType}/{indexName}/schema/name | Get the name of the schema used by the specified core or collection
[**getSchemaSimilarity**](SchemaApi.md#getSchemaSimilarity) | **GET** /{indexType}/{indexName}/schema/similarity | Get the default similarity configuration used by the specified core or collection
[**getSchemaUniqueKey**](SchemaApi.md#getSchemaUniqueKey) | **GET** /{indexType}/{indexName}/schema/uniquekey | Fetch the uniquekey of the specified core or collection
[**getSchemaVersion**](SchemaApi.md#getSchemaVersion) | **GET** /{indexType}/{indexName}/schema/version | Fetch the schema version currently used by the specified core or collection
[**getSchemaZkVersion**](SchemaApi.md#getSchemaZkVersion) | **GET** /{indexType}/{indexName}/schema/zkversion | Fetch the schema version currently used by the specified core or collection
[**listCopyFields**](SchemaApi.md#listCopyFields) | **GET** /{indexType}/{indexName}/schema/copyfields | List all copy-fields in the schema of the specified core or collection
[**listDynamicFields**](SchemaApi.md#listDynamicFields) | **GET** /{indexType}/{indexName}/schema/dynamicfields | List all dynamic-fields in the schema of the specified core or collection
[**listSchemaFieldTypes**](SchemaApi.md#listSchemaFieldTypes) | **GET** /{indexType}/{indexName}/schema/fieldtypes | List all field types in the schema used by the specified core or collection
[**listSchemaFields**](SchemaApi.md#listSchemaFields) | **GET** /{indexType}/{indexName}/schema/fields | List all non-dynamic fields in the schema of the specified core or collection



## addDynamicField

> SolrJerseyResponse addDynamicField(indexType, indexName, dynamicFieldName, opts)

Create a new dynamic field with the specified name.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let dynamicFieldName = "dynamicFieldName_example"; // String | 
let opts = {
  'upsertDynamicFieldOperation': new V2Api.UpsertDynamicFieldOperation() // UpsertDynamicFieldOperation | 
};
apiInstance.addDynamicField(indexType, indexName, dynamicFieldName, opts, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **dynamicFieldName** | **String**|  | 
 **upsertDynamicFieldOperation** | [**UpsertDynamicFieldOperation**](UpsertDynamicFieldOperation.md)|  | [optional] 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## addField

> SolrJerseyResponse addField(indexType, indexName, fieldName, opts)

Add a standard (i.e. non-dynamic) field with the specified name.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let fieldName = "fieldName_example"; // String | 
let opts = {
  'upsertFieldOperation': new V2Api.UpsertFieldOperation() // UpsertFieldOperation | 
};
apiInstance.addField(indexType, indexName, fieldName, opts, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **fieldName** | **String**|  | 
 **upsertFieldOperation** | [**UpsertFieldOperation**](UpsertFieldOperation.md)|  | [optional] 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## addFieldType

> SolrJerseyResponse addFieldType(indexType, indexName, fieldTypeName, opts)

Add a new field-type with the specified name.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let fieldTypeName = "fieldTypeName_example"; // String | 
let opts = {
  'upsertFieldTypeOperation': new V2Api.UpsertFieldTypeOperation() // UpsertFieldTypeOperation | 
};
apiInstance.addFieldType(indexType, indexName, fieldTypeName, opts, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **fieldTypeName** | **String**|  | 
 **upsertFieldTypeOperation** | [**UpsertFieldTypeOperation**](UpsertFieldTypeOperation.md)|  | [optional] 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## bulkSchemaModification

> SolrJerseyResponse bulkSchemaModification(indexType, indexName, opts)

Perform the specified schema modifications.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let opts = {
  'schemaChange': [new V2Api.SchemaChange()] // [SchemaChange] | 
};
apiInstance.bulkSchemaModification(indexType, indexName, opts, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **schemaChange** | [**[SchemaChange]**](SchemaChange.md)|  | [optional] 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## deleteDynamicField

> SolrJerseyResponse deleteDynamicField(indexType, indexName, dynamicFieldName)

Remove the dynamic field with the specified name.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let dynamicFieldName = "dynamicFieldName_example"; // String | 
apiInstance.deleteDynamicField(indexType, indexName, dynamicFieldName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **dynamicFieldName** | **String**|  | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## deleteField

> SolrJerseyResponse deleteField(indexType, indexName, fieldName)

Remove the non-dynamic field with the specified name.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let fieldName = "fieldName_example"; // String | 
apiInstance.deleteField(indexType, indexName, fieldName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **fieldName** | **String**|  | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## deleteFieldType

> SolrJerseyResponse deleteFieldType(indexType, indexName, fieldTypeName)

Remove the field type with the specified name.

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let fieldTypeName = "fieldTypeName_example"; // String | 
apiInstance.deleteFieldType(indexType, indexName, fieldTypeName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **fieldTypeName** | **String**|  | 

### Return type

[**SolrJerseyResponse**](SolrJerseyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getDynamicFieldInfo

> SchemaGetDynamicFieldInfoResponse getDynamicFieldInfo(indexType, indexName, fieldName)

Get detailed info about a single dynamic field

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let fieldName = "fieldName_example"; // String | 
apiInstance.getDynamicFieldInfo(indexType, indexName, fieldName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **fieldName** | **String**|  | 

### Return type

[**SchemaGetDynamicFieldInfoResponse**](SchemaGetDynamicFieldInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getFieldInfo

> SchemaGetFieldInfoResponse getFieldInfo(indexType, indexName, fieldName)

Get detailed info about a single non-dynamic field

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let fieldName = "fieldName_example"; // String | 
apiInstance.getFieldInfo(indexType, indexName, fieldName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **fieldName** | **String**|  | 

### Return type

[**SchemaGetFieldInfoResponse**](SchemaGetFieldInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getFieldTypeInfo

> SchemaGetFieldTypeInfoResponse getFieldTypeInfo(indexType, indexName, fieldTypeName)

Get detailed info about a single field type

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let fieldTypeName = "fieldTypeName_example"; // String | 
apiInstance.getFieldTypeInfo(indexType, indexName, fieldTypeName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **fieldTypeName** | **String**|  | 

### Return type

[**SchemaGetFieldTypeInfoResponse**](SchemaGetFieldTypeInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getSchemaInfo

> SchemaInfoResponse getSchemaInfo(indexType, indexName)

Fetch the entire schema of the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.getSchemaInfo(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaInfoResponse**](SchemaInfoResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getSchemaName

> SchemaNameResponse getSchemaName(indexType, indexName)

Get the name of the schema used by the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.getSchemaName(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaNameResponse**](SchemaNameResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getSchemaSimilarity

> SchemaSimilarityResponse getSchemaSimilarity(indexType, indexName)

Get the default similarity configuration used by the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.getSchemaSimilarity(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaSimilarityResponse**](SchemaSimilarityResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getSchemaUniqueKey

> SchemaUniqueKeyResponse getSchemaUniqueKey(indexType, indexName)

Fetch the uniquekey of the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.getSchemaUniqueKey(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaUniqueKeyResponse**](SchemaUniqueKeyResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getSchemaVersion

> SchemaVersionResponse getSchemaVersion(indexType, indexName)

Fetch the schema version currently used by the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.getSchemaVersion(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaVersionResponse**](SchemaVersionResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## getSchemaZkVersion

> SchemaZkVersionResponse getSchemaZkVersion(indexType, indexName, opts)

Fetch the schema version currently used by the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
let opts = {
  'refreshIfBelowVersion': -1 // Number | 
};
apiInstance.getSchemaZkVersion(indexType, indexName, opts, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 
 **refreshIfBelowVersion** | **Number**|  | [optional] [default to -1]

### Return type

[**SchemaZkVersionResponse**](SchemaZkVersionResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listCopyFields

> SchemaListCopyFieldsResponse listCopyFields(indexType, indexName)

List all copy-fields in the schema of the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.listCopyFields(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaListCopyFieldsResponse**](SchemaListCopyFieldsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listDynamicFields

> SchemaListDynamicFieldsResponse listDynamicFields(indexType, indexName)

List all dynamic-fields in the schema of the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.listDynamicFields(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaListDynamicFieldsResponse**](SchemaListDynamicFieldsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listSchemaFieldTypes

> SchemaListFieldTypesResponse listSchemaFieldTypes(indexType, indexName)

List all field types in the schema used by the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.listSchemaFieldTypes(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaListFieldTypesResponse**](SchemaListFieldTypesResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*


## listSchemaFields

> SchemaListFieldsResponse listSchemaFields(indexType, indexName)

List all non-dynamic fields in the schema of the specified core or collection

### Example

```javascript
import V2Api from 'v2_api';

let apiInstance = new V2Api.SchemaApi();
let indexType = new V2Api.IndexType(); // IndexType | 
let indexName = "indexName_example"; // String | 
apiInstance.listSchemaFields(indexType, indexName, (error, data, response) => {
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
 **indexType** | [**IndexType**](.md)|  | 
 **indexName** | **String**|  | 

### Return type

[**SchemaListFieldsResponse**](SchemaListFieldsResponse.md)

### Authorization

No authorization required

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: */*

