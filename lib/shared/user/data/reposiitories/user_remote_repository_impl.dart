import 'package:chhoto_khabar/features/auth/domain/entity/user.dart';
import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_remote_repository.dart';



class UserRemoteRepositoryImpl implements UserRemoteRepository {
  final UserRemoteDatasource userRemoteDataSource;

  UserRemoteRepositoryImpl(this.userRemoteDataSource);

  @override
  Future<Either<AppException, User>> getUserFromRemote() async {
    return await userRemoteDataSource.getUser();
  }
}
