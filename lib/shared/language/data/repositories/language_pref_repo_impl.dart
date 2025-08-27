import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/language/data/datasource/local/language_local_datasource.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';
import 'package:chhoto_khabar/shared/language/domain/repositories/language_pref_repository.dart';

class LanguagePrefRepoImpl implements LanguagePrefRepository {
  final LanguageLocalDataSource languageLocalDataSource;

  LanguagePrefRepoImpl({required this.languageLocalDataSource});

  @override
  Future<Either<AppException, Language>> getLanguagePreference() async {
    return await languageLocalDataSource.getLanguage();
  }

  @override
  Future<Either<AppException, String>> setLanguagePreference(
      {required Language selectedLanguage}) async {
    return await languageLocalDataSource.setLanguage(
        language: selectedLanguage);
  }
}
