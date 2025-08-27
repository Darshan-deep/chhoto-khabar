import 'package:chhoto_khabar/features/auth/data/datasource/remote/auth_datasource.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/authResponse.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;

  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<AppException, AuthResponse>> signIn({
    required String email,
    required String password,
  }) async {
    final result = await _remoteDataSource.signIn(
      email: email,
      password: password,
    );

    return result.fold(
      (exception) => Left(exception),
      (authResponseModel) => Right(authResponseModel.toEntity()),
    );
  }

  @override
  Future<Either<AppException, AuthResponse>> signUp({
    required String email,
    required String password,
    required String firstName,
    required String lastName,
  }) async {
    final result = await _remoteDataSource.signUp(
      email: email,
      password: password,
      firstName: firstName,
      lastName: lastName,
    );

    return result.fold(
      (exception) => Left(exception),
      (authResponseModel) => Right(authResponseModel.toEntity()),
    );
  }

  @override
  Future<Either<AppException, void>> changePassword({
    required String oldPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await _remoteDataSource.changePassword(
      oldPassword: oldPassword,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }

  @override
  Future<Either<AppException, void>> forgotPassword({
    required String email,
  }) async {
    return await _remoteDataSource.forgotPassword(email: email);
  }

  @override
  Future<Either<AppException, void>> resetPassword({
    required String token,
    required String newPassword,
    required String confirmPassword,
  }) async {
    return await _remoteDataSource.resetPassword(
      token: token,
      newPassword: newPassword,
      confirmPassword: confirmPassword,
    );
  }

  @override
  Future<Either<AppException, void>> logout() async {
    return await _remoteDataSource.logout();
  }

  @override
  Future<Either<AppException, AuthResponse>> refreshToken({
    required String refreshToken,
  }) async {
    final result = await _remoteDataSource.refreshToken(
      refreshToken: refreshToken,
    );

    return result.fold(
      (exception) => Left(exception),
      (authResponseModel) => Right(authResponseModel.toEntity()),
    );
  }
}