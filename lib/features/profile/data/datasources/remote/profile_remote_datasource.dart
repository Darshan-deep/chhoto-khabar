import 'package:fpdart/fpdart.dart';
import '../../../../../shared/exceptions/http_exception.dart';
import '../../models/profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<Either<AppException, ProfileModel>> getProfile();
  Future<Either<AppException, ProfileModel>> updateProfile({
    required Map<String, dynamic> data,
  });
}