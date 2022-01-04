import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';

final options = Options(
  receiveTimeout: 5000,
  sendTimeout: 6000,
);

Future<Response> getIt(
  String url, {
  Map<String, String>? headers,
  Dio? dio,
}) async {
  Logger().i('Url $url');
  final resp = await (dio ?? Dio()).get(
    url,
    options: options,
  );
  Logger().d('Response $resp');
  Logger().d('Response code ${resp.statusCode}');
  return resp;
}

Future<Response> postIt(
  String url, {
  Map<String, String>? headers,
  Map<String, dynamic>? model,
  Dio? dio,
}) async {
  Logger().i('Url $url');
  final resp = await (dio ?? Dio()).post(
    url,
    data: json.encode(model),
    options: options,
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
  Logger().i('Url $url');
  final resp = await (dio ?? Dio()).put(
    url,
    data: model,
    options: options,
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
  Logger().i('Url $url');
  final resp = await (dio ?? Dio()).delete(
    url,
    data: model,
    options: options,
  );
  Logger().d('Response $resp');
  Logger().d('Response code ${resp.statusCode}');
  return resp;
}
