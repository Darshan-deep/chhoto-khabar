import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class RememberMeRepository {
  Future<Either<AppException, String>> getEmail();
  Future<Either<AppException, String>> setEmail({required String email});
  Future<Either<AppException, bool>> deleteEmail();
}
