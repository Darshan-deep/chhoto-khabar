import 'package:chhoto_khabar/features/auth/domain/entity/authResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';


abstract class AuthRepository {
  Future<Either<AppException, AuthResponse>> signIn({
    required String email,
    required String password,
  });

  Future<Either<AppException, AuthResponse>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  });

  Future<Either<AppException, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<AppException, void>> forgotPassword({
    required String email,
  });

  Future<Either<AppException, void>> resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  });

  Future<Either<AppException, void>> logout();

  Future<Either<AppException, AuthResponse>> refreshToken({
    required String refreshToken,
  });
}