/**
 * SimplyConvertCFC
 * Copyright 2024  Matthew J. Clemente, John Berquist
 * Licensed under MIT (https://mit-license.org)
 */
component displayname="SimplyConvertCFC" {

    variables._simplyconvertcfc_version = '0.0.2';

    public any function init(
        string apiKey = '',
        string baseUrl = 'https://simplyconvert.com/api/v2',
        boolean includeRaw = false,
        numeric httpTimeout = 50
    ) {
        structAppend(variables, arguments);

        // map sensitive args to env variables or java system props
        var secrets = {'apiKey': 'SIMPLYCONVERT_API_KEY'};
        var system = createObject('java', 'java.lang.System');

        for (var key in secrets) {
            // arguments are top priority
            if (variables[key].len()) {
                continue;
            }

            // check environment variables
            var envValue = system.getenv(secrets[key]);
            if (!isNull(envValue) && envValue.len()) {
                variables[key] = envValue;
                continue;
            }

            // check java system properties
            var propValue = system.getProperty(secrets[key]);
            if (!isNull(propValue) && propValue.len()) {
                variables[key] = propValue;
            }
        }

        // declare file fields to be handled via multipart/form-data **Important** this is not applicable if payload is application/json
        variables.fileFields = ['file'];

        return this;
    }

    /**
     * Add your first resource here
     * And consider including a link to the docs
     */

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/cases-resource/all-cases/create-new-case
     * @hint Create new case
     * @case expects an instance of the helpers.simplyCase component, but you can construct the struct/json yourself if you prefer
     */
    public struct function createCase(required any case) {
        var payload = isObject(arguments.case)
         ? arguments.case.build()
         : arguments.case;
        return apiCall('POST', '/cases', {}, payload);
    }
    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/cases-resource/all-cases/list-all-cases
     * @hint List all cases
     */
    public struct function listCases(struct queryParams = {}) {
        return apiCall('GET', '/cases', arguments.queryParams);
    }

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/cases-resource/documents/post-a-document
     * @hint Upload a document to a case
     */
    public struct function uploadDocument(required string case_uuid, required any file, any file_meta) {
        var payload = {'file': arguments.file};
        if (!isNull(arguments.file_meta)) {
            payload['file_meta'] = arguments.file_meta;
        }
        return apiCall(
            'POST',
            '/cases/#arguments.case_uuid#/documents',
            {},
            payload,
            {'Content-Type': 'multipart/form-data'}
        );
    }

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/litigations-resource/all-litigations/list-all-litigations
     * @hint List litigations
     */
    public struct function listLitigations() {
        return apiCall('GET', '/litigations');
    }

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/products-resource/all-products/list-all-products
     * @hint List all products
     */
    public struct function listProducts() {
        return apiCall('GET', '/products');
    }

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/information-resource/all-information/list-all-information
     * @hint List all information
     */
    public struct function listInformation() {
        return apiCall('GET', '/information');
    }

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/treatment-resource/all-treatments/list-all-treatments
     * @hint List treatments
     */
    public struct function listTreatments() {
        return apiCall('GET', '/treatments');
    }

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/status-resource/all-statuses/list-all-statuses
     * @hint List statuses
     */
    public struct function listStatuses() {
        return apiCall('GET', '/status');
    }

    /**
     * @docs https://simplyconvertapiv2.docs.apiary.io/#reference/products-resource/products-by-id/retrieve-a-product
     * @hint Retrieve a product by ID.
     */
    public struct function getProductById(required numeric id) {
        return apiCall('GET', '/products/#arguments.id#');
    }

    /**
     * @hint Delete a single resource by ID.
     */
    // public struct function deleteRESOURCE( required numeric id ) {
    //   return apiCall( 'DELETE', '/RESOURCE/#id#' );
    // }

    /**
     * @hint Update a resource by ID.
     */
    // public struct function updateRESOURCE( required numeric id, required any RESOURCE ) {
    //   return apiCall( 'PUT', '/RESOURCE/#id#', {}, {} );
    // }

    // PRIVATE FUNCTIONS
    private struct function apiCall(
        required string httpMethod,
        required string path,
        struct queryParams = {},
        any payload = '',
        struct headers = {}
    ) {
        var fullApiPath = variables.baseUrl & path;
        var requestHeaders = getBaseHttpHeaders();
        requestHeaders.append(headers, true);

        var requestStart = getTickCount();
        var apiResponse = makeHttpRequest(
            httpMethod = httpMethod,
            path = fullApiPath,
            queryParams = queryParams,
            headers = requestHeaders,
            payload = payload
        );

        var result = {
            'responseTime': getTickCount() - requestStart,
            'statusCode': listFirst(apiResponse.statuscode, ' '),
            'statusText': listRest(apiResponse.statuscode, ' '),
            'headers': apiResponse.responseheader
        };

        var parsedFileContent = {};

        // Handle response based on mimetype
        var mimeType = apiResponse.mimetype ?: requestHeaders['Content-Type'];

        if (mimeType == 'application/json' && isJSON(apiResponse.fileContent)) {
            parsedFileContent = deserializeJSON(apiResponse.fileContent);
        } else if (mimeType.listLast('/') == 'xml' && isXML(apiResponse.fileContent)) {
            parsedFileContent = xmlToStruct(apiResponse.fileContent);
        } else {
            parsedFileContent = apiResponse.fileContent;
        }

        // can be customized by API integration for how errors are returned
        // if ( result.statusCode >= 400 ) {}

        // stored in data, because some responses are arrays and others are structs
        result['data'] = parsedFileContent;

        if (variables.includeRaw) {
            result['raw'] = {
                'method': uCase(httpMethod),
                'path': fullApiPath,
                'params': parseQueryParams(queryParams),
                'payload': parseBody(payload),
                'response': apiResponse.fileContent,
                'headers': requestHeaders
            };
        }

        return result;
    }

    private struct function getBaseHttpHeaders() {
        return {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
            'API-Key': '#variables.apiKey#',
            'User-Agent': 'SimplyConvertCFC/#variables._simplyconvertcfc_version# (ColdFusion)'
        };
    }

    private any function makeHttpRequest(
        required string httpMethod,
        required string path,
        struct queryParams = {},
        struct headers = {},
        any payload = ''
    ) {
        var result = '';

        var fullPath = path & (
            !queryParams.isEmpty()
             ? ('?' & parseQueryParams(queryParams, false))
             : ''
        );

        cfhttp(
            url = fullPath,
            method = httpMethod,
            result = "result",
            timeout = variables.httpTimeout
        ) {
            if (isJsonPayload(headers)) {
                var requestPayload = parseBody(payload);
                if (isJSON(requestPayload)) {
                    cfhttpparam(type = "body", value = requestPayload);
                }
            } else if (isFormPayload(headers)) {
                headers.delete('Content-Type'); // Content Type added automatically by cfhttppparam

                for (var param in payload) {
                    if (!variables.fileFields.contains(param)) {
                        var payload_value = isSimpleValue(payload[param]) ? payload[param] : serializeJSON(
                            payload[param]
                        );
                        cfhttpparam(type = "formfield", name = param, value = payload_value);
                    } else {
                        cfhttpparam(type = "file", name = param, file = payload[param]);
                    }
                }
            }

            // handled last, to account for possible Content-Type header correction for forms
            var requestHeaders = parseHeaders(headers);
            for (var header in requestHeaders) {
                cfhttpparam(type = "header", name = header.name, value = header.value);
            }
        }
        return result;
    }

    /**
     * @hint convert the headers from a struct to an array
     */
    private array function parseHeaders(required struct headers) {
        var sortedKeyArray = headers.keyArray();
        sortedKeyArray.sort('textnocase');
        var processedHeaders = sortedKeyArray.map(function(key) {
            return {name: key, value: trim(headers[key])};
        });
        return processedHeaders;
    }

    /**
     * @hint converts the queryparam struct to a string, with optional encoding and the possibility for empty values being pass through as well
     */
    private string function parseQueryParams(
        required struct queryParams,
        boolean encodeQueryParams = true,
        boolean includeEmptyValues = true
    ) {
        var sortedKeyArray = queryParams.keyArray();
        sortedKeyArray.sort('text');

        var queryString = sortedKeyArray.reduce(function(queryString, queryParamKey) {
            var encodedKey = encodeQueryParams
             ? encodeUrl(queryParamKey)
             : queryParamKey;
            if (!isArray(queryParams[queryParamKey])) {
                var encodedValue = encodeQueryParams && len(queryParams[queryParamKey])
                 ? encodeUrl(queryParams[queryParamKey])
                 : queryParams[queryParamKey];
            } else {
                var encodedValue = encodeQueryParams && arrayLen(queryParams[queryParamKey])
                 ? encodeUrl(serializeJSON(queryParams[queryParamKey]))
                 : queryParams[queryParamKey].toList();
            }
            return queryString.listAppend(
                encodedKey & (includeEmptyValues || len(encodedValue) ? ('=' & encodedValue) : ''),
                '&'
            );
        }, '');

        return queryString.len() ? queryString : '';
    }

    private string function parseBody(required any body) {
        if (isStruct(body) || isArray(body)) {
            return serializeJSON(body);
        } else if (isJSON(body)) {
            return body;
        } else {
            return '';
        }
    }

    private string function encodeUrl(required string str, boolean encodeSlash = true) {
        var result = replaceList(urlEncodedFormat(str, 'utf-8'), '%2D,%2E,%5F,%7E', '-,.,_,~');
        if (!encodeSlash) {
            result = replace(result, '%2F', '/', 'all');
        }
        return result;
    }

    /**
     * @hint helper to determine if body should be sent as JSON
     */
    private boolean function isJsonPayload(required struct headers) {
        return headers['Content-Type'] == 'application/json';
    }

    /**
     * @hint helper to determine if body should be sent as form params
     */
    private boolean function isFormPayload(required struct headers) {
        return arrayContains(['application/x-www-form-urlencoded', 'multipart/form-data'], headers['Content-Type']);
    }

    /**
     *
     * Based on an (old) blog post and UDF from Raymond Camden
     * https://www.raymondcamden.com/2012/01/04/Converting-XML-to-JSON-My-exploration-into-madness/
     *
     */
    private struct function xmlToStruct(required any x) {
        if (isSimpleValue(x) && isXML(x)) {
            x = xmlParse(x);
        }

        var s = {};

        if (xmlGetNodeType(x) == 'DOCUMENT_NODE') {
            s[structKeyList(x)] = xmlToStruct(x[structKeyList(x)]);
        }

        if (structKeyExists(x, 'xmlAttributes') && !structIsEmpty(x.xmlAttributes)) {
            s.attributes = {};
            for (var item in x.xmlAttributes) {
                s.attributes[item] = x.xmlAttributes[item];
            }
        }

        if (structKeyExists(x, 'xmlText') && x.xmlText.trim().len()) {
            s.value = x.xmlText;
        }

        if (structKeyExists(x, 'xmlChildren')) {
            for (var xmlChild in x.xmlChildren) {
                if (structKeyExists(s, xmlChild.xmlname)) {
                    if (!isArray(s[xmlChild.xmlname])) {
                        var temp = s[xmlChild.xmlname];
                        s[xmlChild.xmlname] = [temp];
                    }

                    arrayAppend(s[xmlChild.xmlname], xmlToStruct(xmlChild));
                } else {
                    if (structKeyExists(xmlChild, 'xmlChildren') && arrayLen(xmlChild.xmlChildren)) {
                        s[xmlChild.xmlName] = xmlToStruct(xmlChild);
                    } else if (structKeyExists(xmlChild, 'xmlAttributes') && !structIsEmpty(xmlChild.xmlAttributes)) {
                        s[xmlChild.xmlName] = xmlToStruct(xmlChild);
                    } else {
                        s[xmlChild.xmlName] = xmlChild.xmlText;
                    }
                }
            }
        }

        return s;
    }

}
