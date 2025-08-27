import 'package:fpdart/fpdart.dart';
import '../../../../../shared/data/remote/network_service.dart';
import '../../../../../shared/exceptions/http_exception.dart';
import '../../models/profile_model.dart';
import 'profile_remote_datasource.dart';

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final NetworkService _networkService;

  ProfileRemoteDataSourceImpl({
    required NetworkService networkService,
  }) : _networkService = networkService;

  @override
  Future<Either<AppException, ProfileModel>> getProfile() async {
    try {
      print('🔑 ProfileDataSource: Making request to /auth/me/');
      
      final result = await _networkService.get('/auth/me/');

      return result.fold(
        (exception) {
          print('🔑 ProfileDataSource: Error - ${exception.message}');
          return Left(exception);
        },
        (response) {
          try {
            print('🔑 ProfileDataSource: Success - ${response.statusCode}');
            final profileData = response.data as Map<String, dynamic>;
            final profile = ProfileModel.fromJson(profileData);
            return Right(profile);
          } catch (e) {
            print('🔑 ProfileDataSource: Parse error - $e');
            return Left(AppException(
              message: 'Failed to parse profile data: ${e.toString()}',
              identifier: 'PROFILE_PARSING_ERROR',
              statusCode: 500,
            ));
          }
        },
      );
    } catch (e) {
      print('🔑 ProfileDataSource: Exception - $e');
      return Left(AppException(
        message: 'Failed to get profile: ${e.toString()}',
        identifier: 'PROFILE_REQUEST_ERROR',
        statusCode: 500,
      ));
    }
  }

  @override
  Future<Either<AppException, ProfileModel>> updateProfile({
    required Map<String, dynamic> data,
  }) async {
    try {
      print('🔑 ProfileDataSource: Updating profile with data: $data');
      
      final result = await _networkService.patch('/auth/me/', data: data);

      return result.fold(
        (exception) {
          print('🔑 ProfileDataSource: Update error - ${exception.message}');
          return Left(exception);
        },
        (response) {
          try {
            print('🔑 ProfileDataSource: Update success - ${response.statusCode}');
            final profileData = response.data as Map<String, dynamic>;
            final profile = ProfileModel.fromJson(profileData);
            return Right(profile);
          } catch (e) {
            print('🔑 ProfileDataSource: Update parse error - $e');
            return Left(AppException(
              message: 'Failed to parse updated profile data: ${e.toString()}',
              identifier: 'PROFILE_UPDATE_PARSING_ERROR',
              statusCode: 500,
            ));
          }
        },
      );
    } catch (e) {
      print('🔑 ProfileDataSource: Update exception - $e');
      return Left(AppException(
        message: 'Failed to update profile: ${e.toString()}',
        identifier: 'PROFILE_UPDATE_ERROR',
        statusCode: 500,
      ));
    }
  }
}