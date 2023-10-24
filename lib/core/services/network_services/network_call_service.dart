



import 'dart:io';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger_interceptor.dart';
import 'package:talker_dio_logger/talker_dio_logger_settings.dart';/* import '../../util/toast/toast.dart'; */
import 'network_exceptions.dart';

class NetworkCallService {
  final _dio = Dio();

  NetworkCallService({String? baseUrl}) {
    _dio.options.baseUrl = baseUrl ?? "";

    _dio.options.validateStatus = (status) {
      if (status == 204) {
        return false;
      } else if ((status ?? 500) >= 200 && (status ?? 500) <= 300) {
        return true;
      } else {
        return false;
      }
    };
    
    _dio.interceptors.add(
      TalkerDioLogger(
        settings: const TalkerDioLoggerSettings(
          printRequestHeaders: true,
          printResponseHeaders: false,
          printResponseMessage: true,
        ),
      ),
    );

    /* _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          var preHeaders = options.headers;
          preHeaders['Authorization'] = 'Bearer ${AppPref.getToken()}';
          preHeaders['language'] = '${AppPref.getSelectedLanguage()}';
          preHeaders['appVersionCode'] = "$appBuildNumber";
          options.headers = preHeaders;
          return handler.next(
              options); // Pass the modified options to the next interceptor or request
        },
        onResponse: (response, handler) async {
          return handler.next(
              response); // Pass the response to the next interceptor or caller
        },
        onError: (DioException e, handler) {
          if (e.response?.statusCode == 401) {
                AppToast.text.showText("Your session has expired.");
            // var cancelFunc = BotToast.showText(
            //   text: "Your login session has expired. Please log in again.",
            //   onlyOne: true,
            //   duration: Duration(seconds: 5),
            // );
            // cancelFunc();
            AppPref.removeToken();
            NavigationService().navigatorKey.currentState?.pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => MyHome(
                      deeplinkDetails: null,
                      isCommingFromLogout: true,
                    ),
                  ),
                  (route) => false,
                );
          }
          // Handle errors, e.g., retrying the request or showing an error message
          return handler
              .next(e); // Pass the error to the next interceptor or caller
        },
      ),
    ); */
  }

  Future<Response> get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await _dio.get(
      path,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      options: options,
      queryParameters: queryParameters,
    );
  }

  Future<Response> post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    return await _dio.post(
      path,
      data: data,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
      options: options,
      queryParameters: queryParameters,
    );
  }

  static handleError(Object e,
      {required Function(NetworkExceptions) getException,
      required Function(String?) getErrorMessage}) {
    if (e is DioException) {
      String? message;
      message = e.response?.data["message"];
      getErrorMessage(message);

      if ((e.response?.statusCode ?? 500) >= 500 &&
          (e.response?.statusCode ?? 500) <= 500) {
        getException(NetworkExceptions.internalServerError(
            message: e.response?.data['message'] ??
                "Something went wrong, Internal Server error"));
      } else if (e.response?.statusCode == 401) {
        getException(NetworkExceptions.unauthorisedRequest(
            message: e.response?.data['message']));
      } else if (e.response?.statusCode == 204) {
        getException(
          NetworkExceptions.badRequest(
            message: e.response?.data["message"],
          ),
        );
      } else if (e.type == DioExceptionType.connectionTimeout) {
        getException(const NetworkExceptions.requestTimeout());
      } else {
        getException(
            const NetworkExceptions.unexpectedError(message: "Something Went Wrong"));
      }

      //Handle Dio Exceptions
    } else {
      if (e is FormatException) {
        getException(NetworkExceptions.formatException(message: e.toString()));
      } else if (e is SocketException) {
        getException(
            NetworkExceptions.noInternetConnection(message: e.toString()));
      } else {
        getException(NetworkExceptions.unexpectedError(message: e.toString()));
      }
    }
  }
}