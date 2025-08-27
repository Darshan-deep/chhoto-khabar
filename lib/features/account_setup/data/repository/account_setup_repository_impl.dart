import 'dart:developer';
import 'package:chhoto_khabar/features/account_setup/data/datasources/remote/account_setup_datasource.dart';
import 'package:chhoto_khabar/features/account_setup/domain/repository/account_setup_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
import 'package:fpdart/fpdart.dart';


class AccountSetupRepositoryImpl implements AccountSetupRepository {
  final AccountSetupDataSource accountSetupDataSource;
  final UserRepository userRepository;

  AccountSetupRepositoryImpl({
    required this.accountSetupDataSource,
    required this.userRepository,
  });

  @override
  Future<Either<AppException, String>> setupAccount({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  }) async {
    try {
      final result = await accountSetupDataSource.setupAccount(
        firstName: firstName,
        lastName: lastName,
        gender: gender,
        dob: dob,
      );

      return result.fold(
        (exception) => Left(exception),
        (user) async {
          try {
            // Save the updated user data
            await userRepository.saveUser(user: user);
            log("User data saved successfully after account setup");
            return const Right("Account setup completed successfully");
          } catch (e) {
            log("Error saving user after account setup: $e");
            return Left(AppException(
              message: "Account setup completed but failed to save user data",
              statusCode: 1,
              identifier: 'AccountSetupRepository.setupAccount.saveError',
            ));
          }
        },
      );
    } catch (e) {
      log("Account setup repository error: $e");
      return Left(AppException(
        message: "Failed to setup account",
        statusCode: 1,
        identifier: '${e.toString()}\nAccountSetupRepository.setupAccount',
      ));
    }
  }

  @override
  Future<Either<AppException, String>> setPassword({
    required String password,
  }) async {
    try {
      final result = await accountSetupDataSource.setPassword(
        password: password,
      );

      return result.fold(
        (exception) => Left(exception),
        (user) async {
          try {
            // Save the updated user data
            await userRepository.saveUser(user: user);
            log("User data saved successfully after password setup");
            return const Right("Password setup completed successfully");
          } catch (e) {
            log("Error saving user after password setup: $e");
            return Left(AppException(
              message: "Password setup completed but failed to save user data",
              statusCode: 1,
              identifier: 'AccountSetupRepository.setPassword.saveError',
            ));
          }
        },
      );
    } catch (e) {
      log("Password setup repository error: $e");
      return Left(AppException(
        message: "Failed to setup password",
        statusCode: 1,
        identifier: '${e.toString()}\nAccountSetupRepository.setPassword',
      ));
    }
  }
}