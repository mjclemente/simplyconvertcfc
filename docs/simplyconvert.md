# `simplyconvert.cfc` Reference

#### `createCase( required any case )`

Create new case. The parameter `case` expects an instance of the helpers.simplyCase component, but you can construct the struct/json yourself if you prefer. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/cases-resource/all-cases/create-new-case)*

#### `uploadDocument( required string case_uuid, required any file, any file_meta )`

Upload a document to a case. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/cases-resource/documents/post-a-document)*

#### `listLitigations()`

List litigations. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/litigations-resource/all-litigations/list-all-litigations)*

#### `listProducts()`

List all products. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/products-resource/all-products/list-all-products)*

#### `listInformation()`

List all information. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/information-resource/all-information/list-all-information)*

#### `listTreatments()`

List treatments. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/treatment-resource/all-treatments/list-all-treatments)*

#### `listStatuses()`

List statuses. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/status-resource/all-statuses/list-all-statuses)*

#### `getProductById( required numeric id )`

Retrieve a product by ID. *[Endpoint docs](https://simplyconvertapiv2.docs.apiary.io/#reference/products-resource/products-by-id/retrieve-a-product)*

