import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/domain/models/response.dart'
    as response;
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';

import 'package:chhoto_khabar/shared/exceptions/validation_exception.dart';

mixin ExceptionHandlerMixin on NetworkService {
  Future<Either<AppException, response.Response>>
      handleException<T extends Object>(
          Future<Response<dynamic>> Function() handler,
          {String endpoint = ''}) async {
    try {
      final res = await handler();
      return Right(
        response.Response(
          statusCode: res.statusCode ?? 200,
          data: res.data,
          statusMessage: res.statusMessage,
        ),
      );
    } catch (e) {
      String message = '';
      String identifier = '';
      ValidationError? validationErrors;

      int statusCode = 0;
      Map<String, dynamic> data = {};
      switch (e.runtimeType) {
        case const (SocketException):
          e as SocketException;
          message = 'Unable to connect to the server.';
          statusCode = 0;
          identifier = 'Socket Exception ${e.message}\n at  $endpoint';
          break;

        case const (DioException):
          e as DioException;

          if (e.response?.statusCode == 422) {
            debugPrint('Validation Error ${e.message}\n at  $endpoint');
            message = 'Validation Error';
            statusCode = 422;
            identifier = 'Validation Error ${e.message}\n at  $endpoint';

            validationErrors =
                ValidationError.fromJson(e.response?.data['error']);

            break;
          }
          message = getDioErrorMessage(e);
          statusCode = e.response?.statusCode ?? 1;
          identifier = 'DioException ${e.message} \nat  $endpoint';
          data = e.response?.statusCode == 403 ? e.response?.data : {};
          break;

        default:
          message = 'Unknown error occurred';
          statusCode = 2;
          identifier = 'Unknown error ${e.toString()}\n at $endpoint';
      }
      return Left(
        AppException(
            message: message,
            statusCode: statusCode,
            identifier: identifier,
            data: data,
            validationErrors: validationErrors),
      );
    }
  }

  String getDioErrorMessage(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout, Please check your network and try again';
      case DioExceptionType.sendTimeout:
        return 'The request took too long to send. Please check your network and try again.';
      case DioExceptionType.receiveTimeout:
        return 'The server took too long to respond. Please try again later.';
      case DioExceptionType.cancel:
        return 'The request was cancelled. Please try again if this was a mistake.';
      case DioExceptionType.connectionError:
        return 'Unable to Connect!';
      case DioExceptionType.badResponse:
        // Log the complete response for debugging
        debugPrint('Bad Response: ${e.response?.statusCode}');
        debugPrint('Response data: ${e.response?.data}');

        // Handle different status codes specifically
        final statusCode = e.response?.statusCode;

        if (statusCode == 404) {
          return e.response?.data?['message'] ?? 'Resource not found';
        } else if (statusCode == 500 || statusCode == 502 || statusCode == 503) {
          return e.response?.data?['message'] ??
              'Server error occurred. Please try again later.';
        } else if (statusCode == 403) {
          return 'You do not have permission to access this resource.';
        } else if (statusCode == 400 || statusCode == 422) {
          return e.response?.data?['message'] ??
              'Invalid request. Please check your input.';
        } else if (statusCode != null && statusCode >= 500) {
          return e.response?.data?['message'] ??
              'Server error occurred. Please try again later.';
        }

        // Default message for other status codes
        return e.response?.data?["message"] ??
            "The server responded with an error (${e.response?.statusCode}). Please try again later.";
      case DioExceptionType.badCertificate:
        return 'The server certificate is invalid. Please try again later.';
      case DioExceptionType.unknown:
        if (e.error is SocketException) {
          return 'Network connection issue. Please check your internet connection.';
        }
        return 'An error occurred. Please try again later.';
    }
  }
}
