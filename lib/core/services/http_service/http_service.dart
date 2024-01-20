import 'package:dio/dio.dart';

abstract class HttpService {
  // requestes with token
  Future<Response> getRequest(String path);
  Future<Response> postRequest(String path, [Map<String, dynamic>? data]);
  Future<Response> putRequest(String path, [Map<String, dynamic>? data]);
  Future<Response> deleteRequest(String path);

  // requestes without token
  Future<Response> getRequestWithoutToken(String path);
  Future<Response> postRequestWithoutToken(String path,
      [Map<String, dynamic>? data]);
  Future<Response> putRequestWithoutToken(String path,
      [Map<String, dynamic>? data]);
  Future<Response> deleteRequestWithoutToken(String path);

  // mock api by giving the response to be returned
  Future<Response> mockRequest(String path, String data);

  void setToken(String authToken);
}
