// lib/src/features/profile/domain/repository/profile_repository.dart
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../../data/models/profile_model.dart';

abstract class ProfileRepository {
  /// Get current user profile
  Future<Either<AppException, ProfileModel>> getProfile();

  /// Update current user profile
  Future<Either<AppException, ProfileModel>> updateProfile({
    required Map<String, dynamic> data,
  });

  /// Refresh profile data
  Future<Either<AppException, ProfileModel>> refreshProfile();
}