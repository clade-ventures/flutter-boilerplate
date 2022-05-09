import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import '../../services/shared_preferences_service.dart';

/// Defaults Dio Options
final options = Options(
  receiveTimeout: 5000,
  sendTimeout: 6000,
);

const Duration globalTimeout = Duration(seconds: 15);

final interceptors = QueuedInterceptorsWrapper(
  onRequest: (options, handler) {
    options.headers.addAll(SharedPreferencesService.getHeaders());
    return handler.next(options);
  },
  onResponse: (resp, handler) {
    if (kDebugMode) {
      final isBytes = resp.requestOptions.responseType == ResponseType.bytes;
      Logger().i({
        'api': '''
${resp.statusCode}: ${resp.requestOptions.baseUrl}${resp.requestOptions.path}''',
        'headers': resp.requestOptions.headers,
        'queryParams': resp.requestOptions.queryParameters,
        'body': resp.requestOptions.data,
        'response': isBytes ? null : resp.data,
      });
    }
    return handler.next(resp);
  },
  onError: (err, handler) async {
    if (kDebugMode) {
      Logger().e({
        'api': '''
${err.response?.statusCode ?? 0}: ${err.requestOptions.baseUrl}${err.requestOptions.path}''',
        'headers': err.requestOptions.headers,
        'queryParams': err.requestOptions.queryParameters,
        'body': err.requestOptions.data,
        'response': err.response?.data
      });
    }
    return handler.next(err);
  },
);

Future<Response> getIt(
  String url, {
  Map<String, String>? headers,
  Dio? dio,
}) async {
  final getHeaders = headers ?? SharedPreferencesService.getHeaders();
  Logger().i('Url $url');
  Logger().i('Headers $getHeaders');
  final resp = await (dio ?? Injector.getAsReactive<Dio>().state)
      .get(
        url,
        options: options.copyWith(
          headers: getHeaders,
        ),
      )
      .timeout(globalTimeout);
  return resp;
}

Future<Response> postIt(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Dio? dio,
}) async {
  final getHeaders = headers ?? SharedPreferencesService.getHeaders();
  Logger().i('Url $url');
  Logger().i('Headers $getHeaders');
  final resp = await (dio ?? Injector.getAsReactive<Dio>().state).post(
    url,
    data: json.encode(model),
    options: options.copyWith(
      headers: getHeaders,
    ),
  );
  Logger().d('Response $resp');
  Logger().d('Response code ${resp.statusCode}');
  return resp;
}

Future<Response> putIt(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Dio? dio,
}) async {
  final getHeaders = headers ?? SharedPreferencesService.getHeaders();
  Logger().i('Url $url');
  Logger().i('Headers $getHeaders');
  final resp = await (dio ?? Injector.getAsReactive<Dio>().state).put(
    url,
    data: model,
    options: options.copyWith(
      headers: getHeaders,
    ),
  );
  Logger().d('Response $resp');
  Logger().d('Response code ${resp.statusCode}');
  return resp;
}

Future<Response> deleteIt(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Dio? dio,
}) async {
  final getHeaders = headers ?? SharedPreferencesService.getHeaders();
  Logger().i('Url $url');
  Logger().i('Headers $getHeaders');
  final resp = await (dio ?? Injector.getAsReactive<Dio>().state).delete(
    url,
    data: model,
    options: options.copyWith(
      headers: getHeaders,
    ),
  );
  Logger().d('Response $resp');
  Logger().d('Response code ${resp.statusCode}');
  return resp;
}
