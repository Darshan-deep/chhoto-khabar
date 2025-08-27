import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:flutter/foundation.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';



abstract class UserRemoteDatasource {
  Future<Either<AppException, User>> getUser();
}

class UserRemoteDatasourceImpl implements UserRemoteDatasource {
  final NetworkService networkService;
  final UserRepository userRepository;

  UserRemoteDatasourceImpl(
      {required this.networkService, required this.userRepository});

  @override
  Future<Either<AppException, User>> getUser() async {
    try {
      final response = await networkService.get(
        ApiConfigs.getUser,
      );

      return response.fold(
        (exception) async {
          debugPrint(
            'UserRemoteDatasourceImpl.getUser: Error occurred while fetching user data: ${exception.statusCode}',
          );
          if (exception.statusCode == 1) {
            final localUserEither = await userRepository.getUser();
            return localUserEither.fold(
              (l) => Left(AppException(
                  identifier: 'userDataSource.getUser',
                  message: "Local doesn't contain data",
                  statusCode: 1)),
              (user) {
                debugPrint(
                  'UserRemoteDatasourceImpl.getUser: Fallback to local user data',
                );
                return Right(user);
              },
            );
          }
          return Left(exception);
        },
        (result) async {
          if (result.data == null || result.data['user'] == null) {
            return Left(
              AppException(
                message: 'User data not found',
                statusCode: 404,
                identifier: 'userDataSourceImpl.getUser',
              ),
            );
          }
          await userRepository.saveUser(
              user: User.fromJson(result.data['user']));

          final user = User.fromJson(result.data['user']);
          return Right(user);
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to get user details',
          statusCode: 1,
          identifier: 'userDataSourceImpl.getuserById',
        ),
      );
    }
  }
}
