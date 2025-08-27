import 'dart:developer';
import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:chhoto_khabar/shared/data/local/token_storage_service.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';


abstract class AccountSetupDataSource {
  Future<Either<AppException, User>> setupAccount({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  });

  Future<Either<AppException, User>> setPassword({
    required String password,
  });
}

class AccountSetupDataSourceImpl implements AccountSetupDataSource {
  final NetworkService networkService;
  final TokenStorageService tokenStorageService;

  AccountSetupDataSourceImpl({
    required this.networkService,
    required this.tokenStorageService,
  });

  @override
  Future<Either<AppException, User>> setupAccount({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  }) async {
    try {
      final accessToken = await tokenStorageService.getAccessToken();
      log("Access Token Retrieved: $accessToken");
      
      if (accessToken == null) {
        return Left(AppException(
          message: "Access token is null",
          statusCode: 401,
          identifier: 'AccountSetupDataSource.setupAccount',
        ));
      }

      await Future.delayed(const Duration(milliseconds: 100));

      final Map<String, dynamic> requestData = {
        "firstname": firstName,
        "lastname": lastName,
        "date_of_birth": dob,
        "gender": gender.toUpperCase()[0],
        "is_user": true, 
      };

      log("Setup Account Request Data: $requestData");

      final response = await networkService.put(
        ApiConfigs.accountSetup,
        data: requestData,
      );

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            log("Setup Account Response: ${result.data}");
            final user = User.fromJson(result.data["data"]);
            return Right(user);
          } catch (e) {
            log("Error parsing user data: $e");
            return Left(AppException(
              message: "Failed to parse user data",
              statusCode: 1,
              identifier: 'AccountSetupDataSource.setupAccount.parseError',
            ));
          }
        },
      );
    } catch (e) {
      log("Setup Account Error: $e");
      return Left(AppException(
        message: "Something went wrong during account setup",
        statusCode: 1,
        identifier: '${e.toString()}\nAccountSetupDataSource.setupAccount',
      ));
    }
  }

  @override
  Future<Either<AppException, User>> setPassword({
    required String password,
  }) async {
    try {
      final accessToken = await tokenStorageService.getAccessToken();
      log("Access Token Retrieved for Password Setup: $accessToken");
      
      if (accessToken == null) {
        return Left(AppException(
          message: "Authentication token missing",
          statusCode: 401,
          identifier: 'AccountSetupDataSource.setPassword',
        ));
      }

      final Map<String, dynamic> requestData = {
        "password": password,
        "is_user": true,      // Match AuthDataSource field structure
        "is_verified": true,  // Match AuthDataSource field structure
      };

      log("Set Password Request Data: $requestData");

      final response = await networkService.put(
        ApiConfigs.accountSetup,
        data: requestData,
      );

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            log("Set Password Response: ${result.data}");
            final user = User.fromJson(result.data["data"]);
            return Right(user);
          } catch (e) {
            log("Error parsing user data: $e");
            return Left(AppException(
              message: "Failed to parse user data",
              statusCode: 1,
              identifier: 'AccountSetupDataSource.setPassword.parseError',
            ));
          }
        },
      );
    } catch (e) {
      log("Set Password Error: $e");
      return Left(AppException(
        message: "Something went wrong during password setup",
        statusCode: 1,
        identifier: '${e.toString()}\nAccountSetupDataSource.setPassword',
      ));
    }
  }
}