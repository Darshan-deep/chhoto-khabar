import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';

abstract class UserRepository {
  // User data methods
  Future<Either<AppException, User>> getUser();
  Future<Either<AppException, String>> saveUser({required User user});
  Future<Either<AppException, bool>> hasUser();
  Future<Either<AppException, bool>> deleteUser();
  
  // Authentication methods
  Future<bool> isAuthenticated();
  Future<String?> getAccessToken();
  Future<String?> getRefreshToken();
  Future<bool> saveTokens({
    required String accessToken,
    required String refreshToken,
  });
  Future<bool> clearTokens();
  Future<bool> hasValidTokens();
  Future<bool> saveAuthData({
    required String accessToken,
    required String refreshToken,
    required User user,
  });
  Future<bool> clearAuthData();
  Future<bool> hasAuthData();
}