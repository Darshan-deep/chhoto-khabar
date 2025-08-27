import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';

class ClearAuthDataUsecase {
  final UserRepository _userRepository;

  ClearAuthDataUsecase(this._userRepository);

  Future<bool> call() async {
    return await _userRepository.clearAuthData();
  }
}