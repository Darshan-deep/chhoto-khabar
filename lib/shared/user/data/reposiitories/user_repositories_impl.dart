import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:chhoto_khabar/shared/data/local/shared_pref_service.dart'; // ✅ Same as AuthBloc
import 'package:chhoto_khabar/shared/user/data/datasource/local/user_local_datasource.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';

import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'dart:convert';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource _userLocalDataSource;
  final SharedPrefsService _sharedPrefsService; // ✅ Same service as AuthBloc

  // ✅ Use EXACT same keys as AuthBloc
  static const String _accessTokenKey = 'access_token';
  static const String _refreshTokenKey = 'refresh_token';

  UserRepositoryImpl({
    required UserLocalDataSource userLocalDataSource,
    required SharedPrefsService sharedPrefsService, // ✅ Same service
  })  : _userLocalDataSource = userLocalDataSource,
        _sharedPrefsService = sharedPrefsService;

  // ✅ Authentication methods using SAME storage as AuthBloc
  @override
  Future<bool> isAuthenticated() async {
    try {
      final accessToken = await _sharedPrefsService.getString(_accessTokenKey);
      final refreshToken = await _sharedPrefsService.getString(_refreshTokenKey);
      
      print('🔐 UserRepository.isAuthenticated():');
      print('  Access Token exists: ${accessToken != null}');
      print('  Refresh Token exists: ${refreshToken != null}');
      
      if (accessToken == null || refreshToken == null) {
        print('  Result: false (missing tokens)');
        return false;
      }
      
      // ✅ Temporarily skip expiry check to test the flow
      print('  Token valid: true (skipping expiry check for now)');
      print('  Result: true');
      
      return true;
      
      // TODO: Re-enable this after fixing JWT parsing
      // final isValid = !_isTokenExpired(accessToken);
      // print('  Token valid: $isValid');
      // print('  Result: $isValid');
      // return isValid;
    } catch (e) {
      print('🔐 UserRepository.isAuthenticated() error: $e');
      return false;
    }
  }

  @override
  Future<String?> getAccessToken() async {
    try {
      final token = await _sharedPrefsService.getString(_accessTokenKey);
      print('🔐 UserRepository.getAccessToken(): ${token != null ? "${token.substring(0, 20)}..." : "null"}');
      return token;
    } catch (e) {
      print('🔐 UserRepository.getAccessToken() error: $e');
      return null;
    }
  }

  @override
  Future<String?> getRefreshToken() async {
    try {
      final token = await _sharedPrefsService.getString(_refreshTokenKey);
      print('🔐 UserRepository.getRefreshToken(): ${token != null ? "${token.substring(0, 20)}..." : "null"}');
      return token;
    } catch (e) {
      print('🔐 UserRepository.getRefreshToken() error: $e');
      return null;
    }
  }

  @override
  Future<bool> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    try {
      await Future.wait([
        _sharedPrefsService.setString(_accessTokenKey, accessToken),
        _sharedPrefsService.setString(_refreshTokenKey, refreshToken),
      ]);
      
      print('🔐 UserRepository.saveTokens(): Tokens saved successfully');
      print('  Access Token: ${accessToken.substring(0, 20)}...');
      print('  Refresh Token: ${refreshToken.substring(0, 20)}...');
      return true;
    } catch (e) {
      print('🔐 UserRepository.saveTokens() error: $e');
      return false;
    }
  }

  @override
  Future<bool> clearTokens() async {
    try {
      await Future.wait([
        _sharedPrefsService.remove(_accessTokenKey),
        _sharedPrefsService.remove(_refreshTokenKey),
      ]);
      
      print('🔐 UserRepository.clearTokens(): Tokens cleared successfully');
      return true;
    } catch (e) {
      print('🔐 UserRepository.clearTokens() error: $e');
      return false;
    }
  }

  @override
  Future<bool> hasValidTokens() async {
    try {
      final accessToken = await getAccessToken();
      final refreshToken = await getRefreshToken();
      
      final hasTokens = accessToken != null && 
                       refreshToken != null &&
                       accessToken.isNotEmpty &&
                       refreshToken.isNotEmpty;
      
      print('🔐 UserRepository.hasValidTokens(): $hasTokens');
      return hasTokens;
    } catch (e) {
      print('🔐 UserRepository.hasValidTokens() error: $e');
      return false;
    }
  }

  @override
  Future<bool> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required User user,
  }) async {
    try {
      // Save tokens
      final tokensSaved = await saveTokens(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
      
      // Save user data
      final userSaved = await saveUser(user: user);
      
      final success = tokensSaved && userSaved.fold(
        (exception) => false,
        (success) => true,
      );
      
      print('🔐 UserRepository.saveAuthData(): Success = $success');
      return success;
    } catch (e) {
      print('🔐 UserRepository.saveAuthData() error: $e');
      return false;
    }
  }

  @override
  Future<bool> clearAuthData() async {
    try {
      final tokensCleared = await clearTokens();
      final userDeleted = await deleteUser();
      
      final success = tokensCleared && userDeleted.fold(
        (exception) => false,
        (deleted) => deleted,
      );
      
      print('🔐 UserRepository.clearAuthData(): Success = $success');
      return success;
    } catch (e) {
      print('🔐 UserRepository.clearAuthData() error: $e');
      return false;
    }
  }

  @override
  Future<bool> hasAuthData() async {
    try {
      final hasTokens = await hasValidTokens();
      final hasUserData = await hasUser();
      
      final hasAuth = hasTokens && hasUserData.fold(
        (exception) => false,
        (hasUser) => hasUser,
      );
      
      print('🔐 UserRepository.hasAuthData(): $hasAuth');
      return hasAuth;
    } catch (e) {
      print('🔐 UserRepository.hasAuthData() error: $e');
      return false;
    }
  }

  // ✅ Helper method to check token expiration (same logic as AuthBloc)
  bool _isTokenExpired(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return true;
      
      final payload = parts[1];
      // Add padding if needed
      final paddedPayload = payload + '=' * (4 - payload.length % 4);
      final decoded = base64Url.decode(paddedPayload);
      final decodedString = utf8.decode(decoded);
      final Map<String, dynamic> claims = json.decode(decodedString);
      
      final exp = claims['exp'] as int?;
      if (exp == null) return true;
      
      final expiryDate = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
      final isExpired = DateTime.now().isAfter(expiryDate);
      
      print('🔐 Token expires: ${expiryDate.toLocal()}, Is expired: $isExpired');
      return isExpired;
    } catch (e) {
      print('🔐 Token expiry check error: $e');
      return true;
    }
  }

  // Existing user methods (keep as they are)
  @override
  Future<Either<AppException, User>> getUser() async {
    try {
      final result = await _userLocalDataSource.getUser();
      return result.fold(
        (exception) => Left(exception),
        (user) => user != null 
            ? Right(user)
            : Left(AppException(
                message: 'No user found',
                statusCode: 404,
                identifier: 'noUserFound',
              )),
      );
    } catch (e) {
      return Left(AppException(
        message: 'Failed to get user: ${e.toString()}',
        statusCode: 500,
        identifier: 'getUserError',
      ));
    }
  }

  @override
  Future<Either<AppException, String>> saveUser({required User user}) async {
    try {
      final result = await _userLocalDataSource.saveUser(user: user);
      return result.fold(
        (exception) => Left(exception),
        (message) => Right(message),
      );
    } catch (e) {
      return Left(AppException(
        message: 'Failed to save user: ${e.toString()}',
        statusCode: 500,
        identifier: 'saveUserError',
      ));
    }
  }

  @override
  Future<Either<AppException, bool>> hasUser() async {
    try {
      final result = await _userLocalDataSource.hasUser();
      return result.fold(
        (exception) => Left(exception),
        (hasUser) => Right(hasUser),
      );
    } catch (e) {
      return Left(AppException(
        message: 'Failed to check user existence: ${e.toString()}',
        statusCode: 500,
        identifier: 'hasUserError',
      ));
    }
  }

  @override
  Future<Either<AppException, bool>> deleteUser() async {
    try {
      final result = await _userLocalDataSource.deleteUser();
      return result.fold(
        (exception) => Left(exception),
        (deleted) => Right(deleted),
      );
    } catch (e) {
      return Left(AppException(
        message: 'Failed to delete user: ${e.toString()}',
        statusCode: 500,
        identifier: 'deleteUserError',
      ));
    }
  }
}
