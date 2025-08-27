import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../repositories/auth_repository.dart';

class ChangePasswordUseCase implements UsecaseWithParam<void, ChangePasswordParams> {
  final AuthRepository _repository;

  ChangePasswordUseCase(this._repository);

  @override
  Future<Either<AppException, void>> call(ChangePasswordParams params) async {
    return await _repository.changePassword(
      oldPassword: params.oldPassword,
      newPassword: params.newPassword,
      confirmPassword: params.confirmPassword,
    );
  }
}

class ChangePasswordParams {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  ChangePasswordParams({
    required this.oldPassword,
    required this.newPassword,
    required this.confirmPassword,
  });
}