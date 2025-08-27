import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/features/auth/domain/entity/authResponse.dart';
import 'package:chhoto_khabar/features/auth/domain/repositories/auth_repository.dart';

class SignInParams {
  final String email;
  final String password;

  const SignInParams({
    required this.email,
    required this.password,
  });
}

class SignInUseCase {
  final AuthRepository _authRepository;

  SignInUseCase(this._authRepository);

  Future<Either<AppException, AuthResponse>> call(SignInParams params) async {
    return await _authRepository.signIn(
      email: params.email,
      password: params.password,
    );
  }
}