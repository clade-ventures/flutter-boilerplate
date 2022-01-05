import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_strong_boilerplate/services/shared_preferences_service.dart';
import 'package:logger/logger.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

/// Defaults Dio Options
final options = Options(
  receiveTimeout: 5000,
  sendTimeout: 6000,
);

const Duration globalTimeout = Duration(seconds: 15);

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
