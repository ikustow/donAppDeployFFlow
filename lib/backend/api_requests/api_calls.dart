import 'dart:convert';

import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class GetDonatesCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
    "collection":"transsactions",
    "database":"db_noodl",
    "dataSource":"noodlcluster"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'getDonates',
      apiUrl:
          'https://eu-central-1.aws.data.mongodb-api.com/app/data-xyqhq/endpoint/data/v1',
      callType: ApiCallType.POST,
      headers: {
        'api-key':
            'eLC9sFtppw8I7vaYrq5dSBLhPyJjxjNutvGAQ2DaQvRkLFNOI94tkc2s5TKlFxkP',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class LoginCall {
  static Future<ApiCallResponse> call() async {
    const ffApiRequestBody = '''
{
  "username": "ikustov.dev@gmail.com",
  "password": "Ak2137345"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'login',
      apiUrl:
          'https://realm.mongodb.com/api/client/v2.0/app/data-xyqhq/auth/providers/local-userpass/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
