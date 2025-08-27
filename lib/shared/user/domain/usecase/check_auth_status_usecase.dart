import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';

class CheckAuthStatusUsecase {
  final UserRepository _userRepository;

  CheckAuthStatusUsecase(this._userRepository);

  Future<bool> call() async {
    return await _userRepository.isAuthenticated();
  }
}