import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';

void main() {
  group('Localization Tests', () {
    testWidgets('English localization works', (WidgetTester tester) async {
      final englishLocal = lookupAppLocalizations(const Locale('en'));
      
      expect(englishLocal.appTitle, 'Chhoto Khabar');
      expect(englishLocal.home, 'Home');
      expect(englishLocal.profile, 'Profile');
    });

    testWidgets('Nepali localization works', (WidgetTester tester) async {
      final nepaliLocal = lookupAppLocalizations(const Locale('ne'));
      
      expect(nepaliLocal.appTitle, 'छोटो खबर');
      expect(nepaliLocal.home, 'घर');
      expect(nepaliLocal.profile, 'प्रोफाइल');
    });

    testWidgets('AppLocalizations delegate works', (WidgetTester tester) async {
      // Test that delegate supports both locales
      expect(AppLocalizations.delegate.isSupported(const Locale('en')), true);
      expect(AppLocalizations.delegate.isSupported(const Locale('ne')), true);
      expect(AppLocalizations.delegate.isSupported(const Locale('hi')), false);
    });
  });
}
