
import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_remote_repository.dart';


class GetRemoteUserUsecase extends Usecase<User > {
  final UserRemoteRepository repository;

  GetRemoteUserUsecase(this.repository);

  @override
  Future<Either<AppException, User>> call( ) async {
    return await repository.getUserFromRemote(
   
    );
  }
}

