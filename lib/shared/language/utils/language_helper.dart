import 'package:chhoto_khabar/shared/language/domain/model/language_model.dart';

class LanguageHelper {
  /// Get API language code for backend requests
  static String getApiLanguageCode(Language language) {
    switch (language) {
      case Language.english:
        return 'en';
      case Language.nepali:
        return 'np'; // API uses 'np' for Nepali
      case Language.arabic:
        return 'ar';
    }
  }
  
  /// Get Flutter locale code for app localization
  static String getLanguageCode(Language language) {
    switch (language) {
      case Language.english:
        return 'en';
      case Language.nepali:
        return 'ne'; // Flutter uses 'ne' for Nepali locale
      case Language.arabic:
        return 'ar';
    }
  }
  
  static Language getLanguageFromCode(String code) {
    switch (code.toLowerCase()) {
      case 'en':
        return Language.english;
      case 'np':
      case 'ne': // Support both API and locale codes
        return Language.nepali;
      case 'ar':
        return Language.arabic;
      default:
        return Language.english; // Default fallback
    }
  }
}
