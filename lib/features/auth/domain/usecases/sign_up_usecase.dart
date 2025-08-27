import 'package:chhoto_khabar/features/auth/domain/entity/authResponse.dart';
import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../repositories/auth_repository.dart';

class SignUpUseCase implements UsecaseWithParam<AuthResponse, SignUpParams> {
  final AuthRepository _repository;

  SignUpUseCase(this._repository);

  @override
  Future<Either<AppException, AuthResponse>> call(SignUpParams params) async {
    return await _repository.signUp(
      email: params.email,
      password: params.password,
      firstName: params.firstName,
      lastName: params.lastName,
    );
  }
}

class SignUpParams {
  final String email;
  final String password;
  final String firstName;
  final String lastName;

  SignUpParams({
    required this.email,
    required this.password,
    required this.firstName,
    required this.lastName,
  });
}