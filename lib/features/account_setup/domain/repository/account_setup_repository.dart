import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class AccountSetupRepository {
  Future<Either<AppException, String>> setupAccount({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  });

  Future<Either<AppException, String>> setPassword({
    required String password,
  });
}