import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../repositories/auth_repository.dart';

class ForgotPasswordUseCase implements UsecaseWithParam<void, ForgotPasswordParams> {
  final AuthRepository _repository;

  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<AppException, void>> call(ForgotPasswordParams params) async {
    return await _repository.forgotPassword(email: params.email);
  }
}

class ForgotPasswordParams {
  final String email;

  ForgotPasswordParams({required this.email});
}