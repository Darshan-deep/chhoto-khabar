import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';

abstract class UserRemoteRepository {
  Future<Either<AppException, User>> getUserFromRemote();
}
