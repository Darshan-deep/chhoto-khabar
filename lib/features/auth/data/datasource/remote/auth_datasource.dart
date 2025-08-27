import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/features/auth/data/model/auth_response_model.dart';
import 'package:chhoto_khabar/shared/data/local/fcm_token_service.dart';
import 'package:chhoto_khabar/shared/data/local/token_storage_service.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';


abstract class AuthRemoteDataSource {
  Future<Either<AppException, AuthResponseModel>> signIn({
    required String email,
    required String password,
  });

  Future<Either<AppException, AuthResponseModel>> signUp({
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

  Future<Either<AppException, AuthResponseModel>> refreshToken({
    required String refreshToken,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final NetworkService networkService;
  final TokenStorageService tokenStorageService;
  final UserRepository userRepository;
  final FCMTokenService fcmTokenService;

  AuthRemoteDataSourceImpl({
    required this.networkService,
    required this.userRepository,
    required this.tokenStorageService,
    required this.fcmTokenService,
});

  @override
  Future<Either<AppException, AuthResponseModel>> signIn({
    required String email,
    required String password,
  }) async {
    final data = {
      'email': email,
      'password': password,
    };

    final result = await networkService.post(ApiConfigs.login, data: data);

    return result.fold(
      (exception) => Left(exception),
      (response) {
        try {
          final authData = response.data as Map<String, dynamic>;
          final authResponse = AuthResponseModel.fromJson(authData);
          
          if (!authResponse.hasValidTokens) {
            return Left(AppException(
              message: 'Invalid authentication response',
              identifier: 'INVALID_AUTH_RESPONSE',
              statusCode: 422,
            ));
          }
          
          return Right(authResponse);
        } catch (e) {
          return Left(AppException(
            message: 'Failed to parse sign in response: ${e.toString()}',
            identifier: 'SIGNIN_PARSING_ERROR',
            statusCode: 0,
          ));
        }
      },
    );
  }

  @override
  Future<Either<AppException, AuthResponseModel>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    const endpoint = '/auth/register/';
    final data = {
      'email': email,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
    };

    final result = await networkService.post(endpoint, data: data);

    return result.fold(
      (exception) => Left(exception),
      (response) {
        try {
          final authData = response.data as Map<String, dynamic>;
          final authResponse = AuthResponseModel.fromJson(authData);
          return Right(authResponse);
        } catch (e) {
          return Left(AppException(
            message: 'Failed to parse sign up response',
            identifier: 'SIGNUP_PARSING_ERROR',
            statusCode: 0,
          ));
        }
      },
    );
  }

  @override
  Future<Either<AppException, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    const endpoint = '/auth/change-password/';
    final data = {
      'old_password': oldPassword,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };

    final result = await networkService.post(endpoint, data: data);

    return result.fold(
      (exception) => Left(exception),
      (response) => const Right(null),
    );
  }

  @override
  Future<Either<AppException, void>> forgotPassword({
    required String email,
  }) async {
    const endpoint = '/auth/forgot-password/';
    final data = {'email': email};

    final result = await networkService.post(endpoint, data: data);

    return result.fold(
      (exception) => Left(exception),
      (response) => const Right(null),
    );
  }

  @override
  Future<Either<AppException, void>> resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    const endpoint = '/auth/reset-password/';
    final data = {
      'token': token,
      'new_password': newPassword,
      'confirm_password': confirmPassword,
    };

    final result = await networkService.post(endpoint, data: data);

    return result.fold(
      (exception) => Left(exception),
      (response) => const Right(null),
    );
  }

  @override
  Future<Either<AppException, void>> logout() async {
    const endpoint = '/auth/logout/';

    final result = await networkService.post(endpoint);

    return result.fold(
      (exception) => Left(exception),
      (response) => const Right(null),
    );
  }

  @override
  Future<Either<AppException, AuthResponseModel>> refreshToken({
    required String refreshToken,
  }) async {
    const endpoint = '/auth/refresh/';
    final data = {'refresh': refreshToken};

    final result = await networkService.post(endpoint, data: data);

    return result.fold(
      (exception) => Left(exception),
      (response) {
        try {
          final authData = response.data as Map<String, dynamic>;
          final authResponse = AuthResponseModel.fromJson(authData);
          return Right(authResponse);
        } catch (e) {
          return Left(AppException(
            message: 'Failed to parse refresh token response',
            identifier: 'REFRESH_PARSING_ERROR',
            statusCode: 0,
          ));
        }
      },
    );
  }
}
