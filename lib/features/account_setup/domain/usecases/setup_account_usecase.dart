import 'package:chhoto_khabar/features/account_setup/domain/repository/account_setup_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';



class SetupAccountUseCase {
  final AccountSetupRepository accountSetupRepository;

  SetupAccountUseCase({required this.accountSetupRepository});

  Future<Either<AppException, String>> call({
    required String firstName,
    required String lastName,
    required String gender,
    required String dob,
  }) async {
    return await accountSetupRepository.setupAccount(
      firstName: firstName,
      lastName: lastName,
      gender: gender,
      dob: dob,
    );
  }
}