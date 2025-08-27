import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';
import 'package:chhoto_khabar/shared/language/domain/repositories/language_pref_repository.dart';




class GetSelectedLanguageUseCase extends Usecase<Language> {
  final LanguagePrefRepository languageRepository;

  GetSelectedLanguageUseCase(this.languageRepository);

  @override
  Future<Either<AppException, Language>> call() async {
    return await languageRepository.getLanguagePreference();
  }
}