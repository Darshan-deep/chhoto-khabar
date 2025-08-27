// refresh_token_usecase.dart
import 'package:chhoto_khabar/features/auth/domain/repositories/auth_repository.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/authResponse.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class RefreshTokenParams {
  final String refreshToken;

  const RefreshTokenParams({
    required this.refreshToken,
  });
}

abstract class RefreshTokenUseCase {
  Future<Either<AppException, AuthResponse>> call(RefreshTokenParams params);
}
