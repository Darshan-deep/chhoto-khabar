import 'dart:convert';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:chhoto_khabar/shared/data/local/storage_service.dart';

abstract class UserLocalDataSource {
  Future<Either<AppException, User?>> getUser();
  Future<Either<AppException, String>> saveUser({required User user});
  Future<Either<AppException, bool>> hasUser();
  Future<Either<AppException, bool>> deleteUser();
  Future<Either<AppException, bool>> clearUserData();
  Future<Either<AppException, User?>> getUserOrNull();
}

class UserLocalDatasourceImpl implements UserLocalDataSource {
  final StorageService _storageService;

  UserLocalDatasourceImpl({required StorageService storageService})
      : _storageService = storageService;

  static const String _userKey = 'user_data';

  @override
  Future<Either<AppException, User?>> getUser() async {
    try {
      final userData = await _storageService.getString(_userKey);
      
      if (userData == null || userData.isEmpty) {
        return Left(AppException(
          message: 'No user data found',
          statusCode: 404,
          identifier: 'userNotFound',
        ));
      }

      final user = User.fromJson(jsonDecode(userData));
      return Right(user);
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
      final userData = jsonEncode(user.toJson());
      final success = await _storageService.setString(_userKey, userData);
      
      if (success) {
        return const Right('User saved successfully');
      } else {
        return Left(AppException(
          message: 'Failed to save user data',
          statusCode: 500,
          identifier: 'saveUserError',
        ));
      }
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
      final hasData = await _storageService.has(_userKey);
      return Right(hasData);
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
      final success = await _storageService.remove(_userKey);
      return Right(success);
    } catch (e) {
      return Left(AppException(
        message: 'Failed to delete user: ${e.toString()}',
        statusCode: 500,
        identifier: 'deleteUserError',
      ));
    }
  }

  @override
  Future<Either<AppException, bool>> clearUserData() async {
    return await deleteUser();
  }

  @override
  Future<Either<AppException, User?>> getUserOrNull() async {
    try {
      final result = await getUser();
      return result.fold(
        (exception) => const Right(null),
        (user) => Right(user),
      );
    } catch (e) {
      return const Right(null);
    }
  }
}
