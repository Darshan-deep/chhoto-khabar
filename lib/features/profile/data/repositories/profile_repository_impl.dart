// lib/src/features/profile/data/repository/profile_repository_impl.dart
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/remote/profile_remote_datasource.dart';
import '../models/profile_model.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource _remoteDataSource;

  ProfileRepositoryImpl({
    required ProfileRemoteDataSource remoteDataSource,
  }) : _remoteDataSource = remoteDataSource;

  @override
  Future<Either<AppException, ProfileModel>> getProfile() async {
    try {
      print('🔑 ProfileRepository: Getting profile...');

      final result = await _remoteDataSource.getProfile();

      return result.fold(
        (exception) {
          print('🔑 ProfileRepository: DataSource error - ${exception.message}');
          return Left(exception);
        },
        (profile) {
          print('🔑 ProfileRepository: Profile loaded successfully');
          return Right(profile);
        },
      );
    } catch (e) {
      print('🔑 ProfileRepository: Exception - $e');
      return Left(AppException(
        message: 'Repository error: ${e.toString()}',
        identifier: 'PROFILE_REPOSITORY_ERROR',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<AppException, ProfileModel>> refreshProfile() async {
    // For refresh, we just call getProfile again
    return getProfile();
  }

  @override
  Future<Either<AppException, ProfileModel>> updateProfile({
    required Map<String, dynamic> data,
  }) async {
    try {
      print('🔑 ProfileRepository: Updating profile...');

      final result = await _remoteDataSource.updateProfile(data: data);

      return result.fold(
        (exception) {
          print('🔑 ProfileRepository: Update error - ${exception.message}');
          return Left(exception);
        },
        (profile) {
          print('🔑 ProfileRepository: Profile updated successfully');
          return Right(profile);
        },
      );
    } catch (e) {
      print('🔑 ProfileRepository: Update exception - $e');
      return Left(AppException(
        message: 'Repository update error: ${e.toString()}',
        identifier: 'PROFILE_UPDATE_REPOSITORY_ERROR',
        statusCode: 500,
      ));
    }
  }
}