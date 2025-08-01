﻿___INFO___

{
  "type": "CLIENT",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "Data Client Waster",
  "brand": {
    "id": "brand_dummy",
    "displayName": "Waster"
  },
  "description": "Use this Client as a mapper from Request Data to Event Data.",
  "containerContexts": [
    "SERVER"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "CHECKBOX",
    "name": "exposeFPIDCookie",
    "checkboxText": "Expose FPID Cookie",
    "simpleValueType": true,
    "help": "If enabled, the server only accessible FPID cookie, generated by UA/GA4 client, will be duplicated to FPIDP cookie, which will be accessible from the client JS. Highly recommend using this option only in case it is necessary."
  },
  {
    "type": "CHECKBOX",
    "name": "httpOnlyCookie",
    "checkboxText": "Write the _dcid cookie as HttpOnly",
    "simpleValueType": true,
    "help": "If enabled, the _dcid cookie will be written with the HttpOnly flag, making it non-accsessible by javascript.",
    "defaultValue": false
  },
  {
    "type": "CHECKBOX",
    "name": "generateClientId",
    "checkboxText": "Always generate client_id parameter",
    "simpleValueType": true,
    "help": "If enabled, even if the `client_id` parameter will not be determined from the request, it will still be generated. The `client_id` parameter is required by UA/GA4 tags.",
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "prolongCookies",
    "checkboxText": "Automatically prolong Data Tag cookies",
    "simpleValueType": true,
    "help": "If enabled, cookies generated by Data tag will be reseated from the server with an expiration time of two years. Useful if you use Data tag store functionality.",
    "defaultValue": true
  },
  {
    "type": "CHECKBOX",
    "name": "acceptMultipleEvents",
    "checkboxText": "Accept Multiple Events",
    "simpleValueType": true,
    "help": "When the Accept Multiple Events is set to true, the Data Client will parse an array of objects, in the request body, as separate events.\nExample:\n\u003cbr /\u003e\n[\n  {\"event\":\"page_view\"},\n  {\"event\":\"view_item\"}\n]",
    "defaultValue": false
  },
  {
    "type": "GROUP",
    "name": "responseSettings",
    "displayName": "Response Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SELECT",
        "name": "responseStatusCode",
        "displayName": "Response Status Code",
        "selectItems": [
          {
            "value": 200,
            "displayValue": "200"
          },
          {
            "value": 201,
            "displayValue": "201"
          },
          {
            "value": 301,
            "displayValue": "301"
          },
          {
            "value": 302,
            "displayValue": "302"
          },
          {
            "value": 403,
            "displayValue": "403"
          },
          {
            "value": 404,
            "displayValue": "404"
          }
        ],
        "simpleValueType": true,
        "defaultValue": 200
      },
      {
        "type": "GROUP",
        "name": "regularResponseSettings",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "SELECT",
            "name": "responseBody",
            "displayName": "Response Body",
            "macrosInSelect": false,
            "selectItems": [
              {
                "value": "timestamp",
                "displayValue": "JSON Object with timestamp (recommended)"
              },
              {
                "value": "eventData",
                "displayValue": "JSON Object with Event Data"
              },
              {
                "value": "empty",
                "displayValue": "Empty"
              }
            ],
            "simpleValueType": true,
            "defaultValue": "timestamp"
          },
          {
            "type": "CHECKBOX",
            "name": "responseBodyGet",
            "checkboxText": "Send Response Body for GET request",
            "simpleValueType": true,
            "help": "By default, for the GET request type, the answer is image pixel.  \u003ca target\u003d\"_blank\" href\u003d\"https://developers.google.com/tag-manager/serverside/api#setpixelresponse\"\u003eMore Info\u003c/a\u003e."
          }
        ],
        "enablingConditions": [
          {
            "paramName": "responseStatusCode",
            "paramValue": 200,
            "type": "EQUALS"
          },
          {
            "paramName": "responseStatusCode",
            "paramValue": 201,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "redirectResponseSettings",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "TEXT",
            "name": "redirectTo",
            "displayName": "Redirect To",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              },
              {
                "type": "REGEX",
                "args": [
                  "^https?:\\/\\/.*"
                ]
              }
            ]
          },
          {
            "type": "CHECKBOX",
            "name": "lookupForRedirectToParam",
            "checkboxText": "Try to find redirect destination in query params",
            "simpleValueType": true,
            "help": "Override destination URL with query param from request url"
          },
          {
            "type": "TEXT",
            "name": "redirectToQueryParamName",
            "displayName": "Query Param Name",
            "simpleValueType": true,
            "enablingConditions": [
              {
                "paramName": "lookupForRedirectToParam",
                "paramValue": true,
                "type": "EQUALS"
              }
            ],
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "responseStatusCode",
            "paramValue": 301,
            "type": "EQUALS"
          },
          {
            "paramName": "responseStatusCode",
            "paramValue": 302,
            "type": "EQUALS"
          }
        ]
      },
      {
        "type": "GROUP",
        "name": "clientErrorResponseSettings",
        "groupStyle": "NO_ZIPPY",
        "subParams": [
          {
            "type": "TEXT",
            "name": "clientErrorResponseMessage",
            "displayName": "Client Error Response Message",
            "simpleValueType": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "enablingConditions": [
          {
            "paramName": "responseStatusCode",
            "paramValue": 403,
            "type": "EQUALS"
          },
          {
            "paramName": "responseStatusCode",
            "paramValue": 404,
            "type": "EQUALS"
          }
        ]
      }
    ]
  },
  {
    "type": "GROUP",
    "name": "pathSettings",
    "displayName": "Accepted Path Settings",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "SIMPLE_TABLE",
        "name": "path",
        "displayName": "Type additional paths that will be claimed by this client",
        "simpleTableColumns": [
          {
            "defaultValue": "",
            "displayName": "For example: /callback",
            "name": "path",
            "type": "TEXT",
            "isUnique": true,
            "valueValidators": [
              {
                "type": "NON_EMPTY"
              }
            ]
          }
        ],
        "newRowButtonText": "Add path",
        "help": "By default path \u003cb\u003e/data\u003c/b\u003e will be claimed. But you can add more paths that will be claimed by this client."
      }
    ]
  }
]


___SANDBOXED_JS_FOR_SERVER___

require('claimRequest')();

const runContainer = require('runContainer');
const logToConsole = require('logToConsole');
const getRequestPath = require('getRequestPath');
const getRequestMethod = require('getRequestMethod');
const getRequestHeader = require('getRequestHeader');
const getRequestBody = require('getRequestBody');
const setResponseHeader = require('setResponseHeader');
const setResponseStatus = require('setResponseStatus');
const setResponseBody = require('setResponseBody');
const returnResponse = require('returnResponse');
const JSON = require('JSON');
const getType = require('getType');

const path = getRequestPath();
const method = getRequestMethod();

const isPathAllowed = data.path.some(item => item.path === path);

if (!isPathAllowed) {
  logToConsole('Path não está autorizado' + path);
  return;
}

if (method === 'OPTIONS') {
  setResponseHeader('Access-Control-Allow-Origin', getRequestHeader('Origin') || '*');
  setResponseHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  setResponseHeader('Access-Control-Allow-Headers', 'Content-Type, x-gtm-server-preview');
  setResponseHeader('Access-Control-Max-Age', '86400');
  setResponseStatus(204);
  returnResponse();
  return;
}

const body = getRequestBody();
let event = JSON.parse(body);

if (getType(event) !== 'object') {
  setResponseStatus(400);
  setResponseBody('Invalid payload');
  returnResponse();
  return;
}

event.source = 'waster';
event.logToConsole = true;

runContainer(event, () => {
  setResponseHeader('Access-Control-Allow-Origin', getRequestHeader('Origin') || '*');
  setResponseHeader('Access-Control-Allow-Methods', 'POST, OPTIONS');
  setResponseHeader('Access-Control-Allow-Headers', 'Content-Type, x-gtm-server-preview');
  setResponseHeader('Content-Type', 'application/json');
  setResponseStatus(200);
  setResponseBody(JSON.stringify({ status: 'ok' }));
  returnResponse();
});


___SERVER_PERMISSIONS___

[
  {
    "instance": {
      "key": {
        "publicId": "return_response",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "access_response",
        "versionId": "1"
      },
      "param": [
        {
          "key": "writeResponseAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "writeHeaderAccess",
          "value": {
            "type": 1,
            "string": "specific"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "run_container",
        "versionId": "1"
      },
      "param": []
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "read_request",
        "versionId": "1"
      },
      "param": [
        {
          "key": "requestAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "headerAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        },
        {
          "key": "queryParameterAccess",
          "value": {
            "type": 1,
            "string": "any"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  },
  {
    "instance": {
      "key": {
        "publicId": "logging",
        "versionId": "1"
      },
      "param": [
        {
          "key": "environments",
          "value": {
            "type": 1,
            "string": "debug"
          }
        }
      ]
    },
    "clientAnnotations": {
      "isEditedByUser": true
    },
    "isRequired": true
  }
]


___TESTS___

scenarios:
- name: Quick Test
  code: runCode();
setup: ''


___NOTES___

Created on 21/03/2021, 11:24:30


