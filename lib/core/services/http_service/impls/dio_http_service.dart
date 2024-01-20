import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import '../http_service.dart';

const _logName = 'DioHttpService';

class DioHttpService implements HttpService {
  late Dio _dio;
  String? authToken;
  static DioHttpService? _instance;

  factory DioHttpService({required String baseUrl}) =>
      _instance ??= DioHttpService._internal(baseUrl: baseUrl);

  DioHttpService._internal({required String baseUrl}) {
    _dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 10),
        baseUrl: baseUrl,
      ),
    )..interceptors.add(LogInterceptor());
  }

  @override
  Future<Response> deleteRequest(String path) {
    return _dio.delete(path, options: optionsWithToken());
  }

  @override
  Future<Response> deleteRequestWithoutToken(String path) {
    return _dio.delete(path);
  }

  @override
  Future<Response> getRequest(String path,
      [Map<String, dynamic>? queryParams]) {
    var options = optionsWithToken();
    return _dio.get(path, options: options, queryParameters: queryParams);
  }

  @override
  Future<Response> getRequestWithoutToken(String path,
      [Map<String, dynamic>? queryParams]) {
    return _dio.get(path, queryParameters: queryParams);
  }

  @override
  Future<Response> postRequest(String path, [Map<String, dynamic>? data]) {
    return _dio.post(path, data: data, options: optionsWithToken());
  }

  @override
  Future<Response> postRequestWithoutToken(String path,
      [Map<String, dynamic>? data]) {
    return _dio.post(path, data: data);
  }

  @override
  Future<Response> putRequest(String path, [Map<String, dynamic>? data]) {
    return _dio.put(path, data: data, options: optionsWithToken());
  }

  @override
  Future<Response> putRequestWithoutToken(String path,
      [Map<String, dynamic>? data]) {
    return _dio.put(path, data: data);
  }

  Options optionsWithToken() {
    log('auth token $authToken', name: _logName);
    return Options(
      headers: {
        HttpHeaders.authorizationHeader: "Bearer $authToken",
        'Content-Type': 'application/json'
      },
    );
  }

  @override
  Future<Response> mockRequest(String path, String data) async {
    await Future.delayed(Duration(seconds: 2));
    return Response(
      data: data,
      requestOptions: RequestOptions(path: ''),
    );
  }

  @override
  void setToken(String authToken) {
    this.authToken = authToken;
  }
}
