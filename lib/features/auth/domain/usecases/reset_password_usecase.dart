import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../repositories/auth_repository.dart';

class ResetPasswordUseCase implements UsecaseWithParam<void, ResetPasswordParams> {
  final AuthRepository _repository;

  ResetPasswordUseCase(this._repository);

  @override
  Future<Either<AppException, void>> call(ResetPasswordParams params) async {
    return await _repository.resetPassword(
      token: params.token,
      newPassword: params.newPassword,
      confirmPassword: params.confirmPassword,
    );
  }
}

class ResetPasswordParams {
  final String token;
  final String newPassword;
  final String confirmPassword;

  ResetPasswordParams({
    required this.token,
    required this.newPassword,
    required this.confirmPassword,
  });
}