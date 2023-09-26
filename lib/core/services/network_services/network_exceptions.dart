
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'network_exceptions.freezed.dart';

@freezed
abstract class NetworkExceptions with _$NetworkExceptions {
  const factory NetworkExceptions.requestCancelled({required String? message}) = RequestCancelled;

  const factory NetworkExceptions.unauthorisedRequest({required String? message}) = UnauthorisedRequest;

  const factory NetworkExceptions.badRequest({required String? message}) = BadRequest;

  const factory NetworkExceptions.notFound({required String? message}) = NotFound;

  const factory NetworkExceptions.methodNotAllowed({required String? message}) = MethodNotAllowed;

  const factory NetworkExceptions.notAcceptable({required String? message}) = NotAcceptable;

  const factory NetworkExceptions.requestTimeout() = RequestTimeout;

  const factory NetworkExceptions.sendTimeout({required String? message}) = SendTimeout;

  const factory NetworkExceptions.conflict({required String? message}) = Conflict;

  const factory NetworkExceptions.internalServerError({required String? message}) = InternalServerError;

  const factory NetworkExceptions.notImplemented({required String? message}) = NotImplemented;

  const factory NetworkExceptions.serviceUnavailable() = ServiceUnavailable;

  const factory NetworkExceptions.noInternetConnection({required String? message}) = NoInternetConnection;

  const factory NetworkExceptions.formatException({required String? message}) = FormatException;

  const factory NetworkExceptions.unableToProcess({required String? message}) = UnableToProcess;

  const factory NetworkExceptions.defaultError({required String? message}) = DefaultError;

  const factory NetworkExceptions.unexpectedError({required String? message}) = UnexpectedError;

}