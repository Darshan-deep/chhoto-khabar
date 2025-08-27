import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/shared/data/local/token_storage_service.dart';
import 'package:chhoto_khabar/shared/data/remote/custom_log_interceptor.dart';
import 'package:chhoto_khabar/shared/data/remote/enhanced_log_interceptor.dart';
import 'package:chhoto_khabar/shared/data/remote/token_interceptor.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/globals.dart';
import 'package:chhoto_khabar/shared/mixins/exception_handler_mixin.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/domain/models/response.dart'
    as response;



class DioNetworkService extends NetworkService with ExceptionHandlerMixin {


  final Dio dio;
  final TokenStorageService tokenStorageService;
  final UserRepository userRepository;

  DioNetworkService({ required this.tokenStorageService,required this.userRepository,
      required this.dio}) {
    if (!kTestMode) {
      dio.options = dioBaseOptions;

      dio.interceptors
          .add(TokenInterceptor(dio, tokenStorageService, userRepository));
    }

     if (kDebugMode) {
       // For full logging
dio.interceptors.add(EnhancedLogInterceptor());


      }
    
  }

  BaseOptions get dioBaseOptions => BaseOptions(
        baseUrl: baseUrl,
        headers: headers,
        connectTimeout: const Duration(milliseconds: 10000),
        receiveTimeout: const Duration(milliseconds: 20000),
      );

  @override
  String get baseUrl => ApiConfigs.baseUrl;

  @override
  Map<String, Object> get headers => {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
      };

  @override
  Map<String, dynamic>? updateHeader(Map<String, dynamic> data) {
    final header = {...data, ...headers};
    if (!kTestMode) {
      dio.options.headers = header;
    }
    return header;
  }

  @override
  Future<Either<AppException, response.Response>> get(String endpoint,
      {Map<String, dynamic>? queryParameters}) {
    final res = handleException(
      () => dio.get(
        endpoint,
        queryParameters: queryParameters,
      ),
      endpoint: endpoint,
    );
    return res;
  }
  @override
    Future<Either<AppException, response.Response>> patch(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.patch(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }
    @override
  Future<Either<AppException, response.Response>> putFormData(String endpoint,
      {Map<String, dynamic>? data}) {
    final formData = FormData.fromMap(data ?? {});
    final res = handleException(
      () => dio.put(
        endpoint,
        data: formData,
        options: Options(
          headers: {
            'Content-Type': 'multipart/form-data',
          },
        ),
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> post(String endpoint,
      {Map<String, dynamic>? data, Object? formData}) {
    final result = handleException(
      () => dio.post(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return result;
  }

  @override
  Future<Either<AppException, response.Response>> postMultipart(String endpoint,
      {Object? data, Map<String, dynamic>? additionalHeaders}) {
    final result = handleException(
      () => dio.post(
        endpoint,
        data: data,
        options: Options(
          headers: {
            ...additionalHeaders ?? {},
          },
        ),
      ),
      endpoint: endpoint,
    );
    return result;
  }

  @override
  Future<Either<AppException, response.Response>> put(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.put(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }

  @override
  Future<Either<AppException, response.Response>> putMultipart(String endpoint,
      {Object? data, Map<String, dynamic>? additionalHeaders}) {
    final result = handleException(
      () => dio.put(
        endpoint,
        data: data,
        options: Options(
          headers: {
            ...additionalHeaders ?? {},
          },
        ),
      ),
      endpoint: endpoint,
    );
    return result;
  }

  @override
  Future<Either<AppException, response.Response>> delete(String endpoint,
      {Map<String, dynamic>? data}) {
    final res = handleException(
      () => dio.delete(
        endpoint,
        data: data,
      ),
      endpoint: endpoint,
    );
    return res;
  }
}
