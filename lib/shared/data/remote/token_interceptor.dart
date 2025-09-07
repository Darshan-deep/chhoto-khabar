import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:dart_jsonwebtoken/dart_jsonwebtoken.dart';
import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/core/router/app_router.dart';
import 'package:chhoto_khabar/shared/data/local/token_storage_service.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';

class TokenInterceptor extends QueuedInterceptorsWrapper {
  final Dio dio;
  final TokenStorageService tokenStorageService;
  final UserRepository userRepository;

  static Future<Response?>? _refreshTokenRequest;
  static const int _tokenExpiryThreshold = 5;
  static bool _isRefreshing = false;
  static bool _isHandlingSessionExpiration = false;

  // Define public endpoints that don't require authentication
  static const List<String> publicEndpoints = [
    '/categories/',
    '/articles/',
    '/articles/trending/',
    '/department/list-search/',
    '/department/online-list-search/',
    '/termsandcondition/list/create/',
    // Add other public endpoints here as needed
  ];

  TokenInterceptor(this.dio, this.tokenStorageService, this.userRepository);

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    try {
      // Check if this is a public endpoint that doesn't require authentication
      if (_isPublicEndpoint(options.path)) {
        debugPrint('🌐 Public endpoint accessed: ${options.path}');
        handler.next(options);
        return;
      }

      final accessToken = await userRepository.getAccessToken();

      if (accessToken == null) {
        debugPrint('! No access token available for: ${options.path}');
        _handleNoToken(options, handler);
        return;
      }

      if (_shouldRefreshToken(accessToken)) {
        debugPrint('🔄 Token expired, refreshing...');
        await _handleTokenRefresh();
        final newToken = await userRepository.getAccessToken(); 

        if (newToken == null) {
          _handleNoToken(options, handler);
          return;
        }

        options.headers['Authorization'] = 'Bearer $newToken';
      } else {
        options.headers['Authorization'] = 'Bearer $accessToken';
      }

      handler.next(options);
    } catch (error, stackTrace) {
      debugPrint('❌ Error in onRequest: $error\n$stackTrace');
      handler.reject(DioException(
        requestOptions: options,
        error: error,
        type: DioExceptionType.unknown,
      ));
    }
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    debugPrint('🔴 Error for ${err.requestOptions.path}: ${err.response?.statusCode}');

    if (!_isTokenExpiredError(err)) {
      handler.next(err);
      return;
    }

    debugPrint('🔴 401 Unauthorized - Attempting token refresh for ${err.requestOptions.path}');

    try {
      final refreshToken = await userRepository.getRefreshToken();
      if (refreshToken == null) {
        debugPrint('⚠️ No refresh token available for 401 response');
        await _handleSessionExpiration();
        handler.next(err);
        return;
      }

      final response = await _retryRequestWithNewToken(err.requestOptions);
      handler.resolve(response);
    } catch (error) {
      debugPrint('❌ Token refresh failed: $error');

      if (error is DioException && _isTokenExpiredError(error)) {
        await _handleSessionExpiration();
      }

      handler.reject(err);
    }
  }

  bool _shouldRefreshToken(String token) {
    try {
      // ✅ Use proper JWT library
      final jwt = JWT.decode(token);
      final expiration = jwt.payload['exp'];

      if (expiration == null) return true;

      final expirationTime = DateTime.fromMillisecondsSinceEpoch(
        (expiration as num).toInt() * 1000,
      );

      final shouldRefresh = DateTime.now().isAfter(
        expirationTime.subtract(const Duration(seconds: _tokenExpiryThreshold)),
      );

      debugPrint('🕒 Token expiration: ${expirationTime.toLocal()}. Should refresh: $shouldRefresh');
      return shouldRefresh;
    } catch (e) {
      debugPrint('❌ Error decoding token: $e');
      return true;
    }
  }

  Future<void> _handleTokenRefresh() async {
    if (_isRefreshing) {
      debugPrint('🔄 Token refresh already in progress');
      try {
        await _refreshTokenRequest;
      } catch (e) {
        debugPrint('Error waiting for refresh: $e');
      }
      return;
    }

    _isRefreshing = true;

    try {
      // ✅ Use UserRepository for refresh token
      final refreshToken = await userRepository.getRefreshToken();
      debugPrint('Refresh Token Retrieved: ${refreshToken != null ? '${refreshToken.substring(0, min(20, refreshToken.length))}...' : 'null'}');

      if (refreshToken == null || refreshToken.isEmpty) {
        debugPrint('! No refresh token available');
        throw Exception('No refresh token available');
      }

      _refreshTokenRequest = _refreshToken(refreshToken);
      final response = await _refreshTokenRequest;

      if (response == null) {
        throw DioException(
          requestOptions: RequestOptions(path: ApiConfigs.getAccessToken),
          error: 'Token refresh failed - No response data',
          type: DioExceptionType.unknown,
        );
      }

      final newToken = response.data?['access'];

      if (newToken == null) {
        throw DioException(
          requestOptions: RequestOptions(path: ApiConfigs.getAccessToken),
          error: 'Token refresh failed - No access token in response',
        );
      }

      // ✅ Use UserRepository to save new token
      await userRepository.saveTokens(
        accessToken: newToken,
        refreshToken: refreshToken, // Keep the same refresh token
      );
      
      debugPrint('✅ New access token saved successfully via UserRepository');
    } catch (e, stackTrace) {
      debugPrint('❌ Error in _handleTokenRefresh: $e\n$stackTrace');
      await _handleSessionExpiration();
      rethrow;
    } finally {
      _refreshTokenRequest = null;
      _isRefreshing = false;
    }
  }

  Future<Response?> _refreshToken(String refreshToken) async {
    try {
      debugPrint('🔄 Refreshing token...');
      log('Refresh Token: $refreshToken');

      final refreshDio = Dio();
      final refreshUrl = ApiConfigs.baseUrl + ApiConfigs.getAccessToken;
      debugPrint('Refresh URL: $refreshUrl');

      final response = await refreshDio.post(
        refreshUrl,
        data: {'refresh': refreshToken},
        options: Options(
          headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
          validateStatus: (status) => true,
          receiveTimeout: const Duration(seconds: 15),
          sendTimeout: const Duration(seconds: 15),
        ),
      );

      debugPrint('Token refresh response: Status ${response.statusCode}, Data: ${response.data}');

      if (response.statusCode == 200) {
        debugPrint('✅ Token refresh successful');
        return response;
      } else {
        debugPrint('❌ Token refresh failed: ${response.statusCode}');
        return null;
      }
    } on DioException catch (e) {
      debugPrint('❌ DioException during refresh: ${e.type.name}');
      if (e.error != null) {
        debugPrint('Error details: ${e.error}');
      }
      return null;
    } catch (e, stackTrace) {
      debugPrint('❌ Unexpected error during refresh: $e\n$stackTrace');
      return null;
    }
  }

  Future<Response<dynamic>> _retryRequestWithNewToken(RequestOptions requestOptions) async {
    try {
      await _handleTokenRefresh();
      // ✅ Use UserRepository to get new token
      final newToken = await userRepository.getAccessToken();

      if (newToken == null) {
        throw DioException(
          requestOptions: requestOptions,
          error: 'Could not refresh token',
          type: DioExceptionType.unknown,
        );
      }

      requestOptions.headers['Authorization'] = 'Bearer $newToken';
      debugPrint('🔄 Retrying request with new token: ${requestOptions.path}');

      return dio.fetch(requestOptions);
    } catch (e) {
      debugPrint('Failed to retry request: $e');
      rethrow;
    }
  }

  Future<void> _handleSessionExpiration() async {
    if (_isHandlingSessionExpiration) {
      return;
    }

    _isHandlingSessionExpiration = true;
    debugPrint('🔴 Session expired - Logging out user');

    try {
      // ✅ Use UserRepository to clear auth data
      await userRepository.clearAuthData();
      
      appRouter.go('/login');
    } catch (e) {
      debugPrint('❌ Error during session expiration handling: $e');
      appRouter.go('/login');
    } finally {
      _isHandlingSessionExpiration = false;
    }
  }

  bool _isPublicEndpoint(String path) {
    debugPrint('🔍 Checking if endpoint is public: $path');
    final isPublic = publicEndpoints.any((endpoint) {
      // Exact match or starts with the endpoint pattern
      if (path == endpoint || path.startsWith('$endpoint/')) {
        return true;
      }
      
      // Handle query parameters
      if (path.contains('?')) {
        final pathWithoutQuery = path.split('?')[0];
        return pathWithoutQuery == endpoint || pathWithoutQuery.startsWith('$endpoint/');
      }
      
      return false;
    });
    
    debugPrint('🔍 Path $path is ${isPublic ? 'PUBLIC' : 'PRIVATE'}');
    return isPublic;
  }

  void _handleNoToken(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint('⚠️ No access token available for: ${options.path}');

    // Instead of redirecting to login, return a 401 error that UI can handle with dialog
    handler.reject(DioException(
      requestOptions: options,
      type: DioExceptionType.badResponse,
      response: Response(
        requestOptions: options,
        statusCode: 401,
        statusMessage: 'Authentication required',
        data: {'message': 'Please login to perform this action'},
      ),
      error: 'Authentication required',
    ));
  }

  bool _isTokenExpiredError(DioException error) {
    return error.response?.statusCode == 401;
  }
}

int min(int a, int b) {
  return a < b ? a : b;
}
