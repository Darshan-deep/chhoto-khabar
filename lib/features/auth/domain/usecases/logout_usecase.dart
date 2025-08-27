import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:fpdart/fpdart.dart';
import '../../../../shared/exceptions/http_exception.dart';
import '../repositories/auth_repository.dart';

class LogoutUseCase implements Usecase<void> {
  final AuthRepository _repository;

  LogoutUseCase(this._repository);

  @override
  Future<Either<AppException, void>> call() async {
    return await _repository.logout();
  }
}