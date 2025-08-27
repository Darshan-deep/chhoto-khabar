import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/domain/models/usecase.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';
import 'package:chhoto_khabar/shared/language/domain/repositories/language_pref_repository.dart';



class SetSelectedLanguageUseCase extends UsecaseWithParam<String, Language> {
  final LanguagePrefRepository languageRepository;

  SetSelectedLanguageUseCase(this.languageRepository);

  @override
  Future<Either<AppException, String>> call(Language params) async {
    return await languageRepository.setLanguagePreference(selectedLanguage: params);
  }
}
