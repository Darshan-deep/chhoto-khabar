

import 'package:fpdart/fpdart.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';




abstract class LanguagePrefRepository {
  Future<Either<AppException, Language>> getLanguagePreference();
  Future<Either<AppException, String>> setLanguagePreference({required Language selectedLanguage});
}