import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ne'),
  ];

  String get appTitle;
  String get profile;
  String get home;
  String get trending;
  String get subscription;
  String get saved;
  String get bookmark;
  String get notifications;
  String get settings;
  String get searchHint;
  String get category;
  String get politics;
  String get sports;
  String get entertainment;
  String get technology;
  String get health;
  String get business;
  String get international;
  String get national;
  String get science;
  String get opinion;
  String get lifestyle;
  String get education;
  String get othersCategory;
  String get readMore;
  String get share;
  String get like;
  String get comment;
  String get signIn;
  String get signOut;
  String get email;
  String get password;
  String get forgotPassword;
  String get noAccount;
  String get createAccount;
  String get alreadyHaveAccount;
  String get cancel;
  String get confirm;
  String get bookmarks;
  String get language;
  String get english;
  String get nepali;
  String get selectLanguage;
  String get categories;
  String get myBookmarks;
  String get logout;
  String get login;
  String get loginTitle;
  String get welcomeMessage;
  String get phoneNumber;
  String get enterYourPhoneNumber;
  String get enterYourPassword;
  String get dontHaveAccount;
  String get signUp;
  String get fullName;
  String get fullNameHint;
  String get createProfile;
  String get trendingNews;
  String get newsNotFound;
  String get errorLoadingNews;
  String get retry;
  String get allCategories;
  String get newsInNepal;
  String get latestUpdates;
  String get searchForNews;
  String get suggestedCategories;
  String get trendingSearches;
  String get searchHistory;
  String get clearHistory;
  String get noSearchHistory;
  String get noResultsFound;
  String get tryDifferentKeywords;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ne'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  switch (locale.languageCode) {
    case 'en': return _AppLocalizationsEn();
    case 'ne': return _AppLocalizationsNe();
  }
  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue on GitHub with a '
    'reproducible sample app and the gen-l10n configuration that was used.');
}

class _AppLocalizationsEn extends AppLocalizations {
  _AppLocalizationsEn() : super('en');

  @override
  String get appTitle => 'Chhoto Khabar';
  @override
  String get profile => 'Profile';
  @override
  String get home => 'Home';
  @override
  String get trending => 'Trending';
  @override
  String get subscription => 'Subscription';
  @override
  String get saved => 'Saved';
  @override
  String get bookmark => 'Bookmark';
  @override
  String get notifications => 'Notifications';
  @override
  String get settings => 'Settings';
  @override
  String get searchHint => 'Search...';
  @override
  String get category => 'Category';
  @override
  String get politics => 'Politics';
  @override
  String get sports => 'Sports';
  @override
  String get entertainment => 'Entertainment';
  @override
  String get technology => 'Technology';
  @override
  String get health => 'Health';
  @override
  String get business => 'Business';
  @override
  String get international => 'International';
  @override
  String get national => 'National';
  @override
  String get science => 'Science';
  @override
  String get opinion => 'Opinion';
  @override
  String get lifestyle => 'Lifestyle';
  @override
  String get education => 'Education';
  @override
  String get othersCategory => 'Others';
  @override
  String get readMore => 'Read More';
  @override
  String get share => 'Share';
  @override
  String get like => 'Like';
  @override
  String get comment => 'Comment';
  @override
  String get signIn => 'Sign In';
  @override
  String get signOut => 'Sign Out';
  @override
  String get email => 'Email';
  @override
  String get password => 'Password';
  @override
  String get forgotPassword => 'Forgot Password?';
  @override
  String get noAccount => 'No account?';
  @override
  String get createAccount => 'Create Account';
  @override
  String get alreadyHaveAccount => 'Already have an account?';
  @override
  String get cancel => 'Cancel';
  @override
  String get confirm => 'Confirm';
  @override
  String get bookmarks => 'Bookmarks';
  @override
  String get language => 'Language';
  @override
  String get english => 'English';
  @override
  String get nepali => 'Nepali';
  @override
  String get selectLanguage => 'Select Language';
  @override
  String get categories => 'Categories';
  @override
  String get myBookmarks => 'My Bookmarks';
  @override
  String get logout => 'Logout';
  @override
  String get login => 'Login';
  @override
  String get loginTitle => 'Login';
  @override
  String get welcomeMessage => 'Welcome back';
  @override
  String get phoneNumber => 'Phone Number';
  @override
  String get enterYourPhoneNumber => 'Enter your phone number';
  @override
  String get enterYourPassword => 'Enter your password';
  @override
  String get dontHaveAccount => 'Don\'t have an account?';
  @override
  String get signUp => 'Sign Up';
  @override
  String get fullName => 'Full Name';
  @override
  String get fullNameHint => 'Enter your full name';
  @override
  String get createProfile => 'Create Profile';
  @override
  String get trendingNews => 'Trending News';
  @override
  String get newsNotFound => 'No news found';
  @override
  String get errorLoadingNews => 'Error loading news';
  @override
  String get retry => 'Retry';
  @override
  String get allCategories => 'All Categories';
  @override
  String get newsInNepal => 'News in Nepal';
  @override
  String get latestUpdates => 'Latest Updates';
  @override
  String get searchForNews => 'Search for news';
  @override
  String get suggestedCategories => 'Suggested Categories';
  @override
  String get trendingSearches => 'Trending Searches';
  @override
  String get searchHistory => 'Search History';
  @override
  String get clearHistory => 'Clear History';
  @override
  String get noSearchHistory => 'No search history';
  @override
  String get noResultsFound => 'No results found';
  @override
  String get tryDifferentKeywords => 'Try different keywords';
}

class _AppLocalizationsNe extends AppLocalizations {
  _AppLocalizationsNe() : super('ne');

  @override
  String get appTitle => 'छोटो खबर';
  @override
  String get profile => 'प्रोफाइल';
  @override
  String get home => 'घर';
  @override
  String get trending => 'ट्रेंडिङ';
  @override
  String get subscription => 'सदस्यता';
  @override
  String get saved => 'सुरक्षित';
  @override
  String get bookmark => 'बुकमार्क';
  @override
  String get notifications => 'सूचनाहरू';
  @override
  String get settings => 'सेटिङहरू';
  @override
  String get searchHint => 'खोज्नुहोस्';
  @override
  String get category => 'श्रेणी';
  @override
  String get politics => 'राजनीति';
  @override
  String get sports => 'खेलकुद';
  @override
  String get entertainment => 'मनोरञ्जन';
  @override
  String get technology => 'प्रविधि';
  @override
  String get health => 'स्वास्थ्य';
  @override
  String get business => 'व्यापार';
  @override
  String get international => 'अन्तर्राष्ट्रिय';
  @override
  String get national => 'राष्ट्रिय';
  @override
  String get science => 'विज्ञान';
  @override
  String get opinion => 'विचार';
  @override
  String get lifestyle => 'जीवनशैली';
  @override
  String get education => 'शिक्षा';
  @override
  String get othersCategory => 'अन्य';
  @override
  String get readMore => 'थप पढ्नुहोस्';
  @override
  String get share => 'साझा गर्नुहोस्';
  @override
  String get like => 'मन पराउनुहोस्';
  @override
  String get comment => 'टिप्पणी';
  @override
  String get signIn => 'साइन इन';
  @override
  String get signOut => 'साइन आउट';
  @override
  String get email => 'इमेल';
  @override
  String get password => 'पासवर्ड';
  @override
  String get forgotPassword => 'पासवर्ड बिर्सनुभयो?';
  @override
  String get noAccount => 'खाता छैन?';
  @override
  String get createAccount => 'खाता सिर्जना गर्नुहोस्';
  @override
  String get alreadyHaveAccount => 'पहिले नै खाता छ?';
  @override
  String get cancel => 'रद्द गर्नुहोस्';
  @override
  String get confirm => 'पुष्टि गर्नुहोस्';
  @override
  String get bookmarks => 'बुकमार्कहरू';
  @override
  String get language => 'भाषा';
  @override
  String get english => 'अङ्ग्रेजी';
  @override
  String get nepali => 'नेपाली';
  @override
  String get selectLanguage => 'भाषा छान्नुहोस्';
  @override
  String get categories => 'श्रेणीहरू';
  @override
  String get myBookmarks => 'मेरा बुकमार्कहरू';
  @override
  String get logout => 'लगआउट';
  @override
  String get login => 'लगइन';
  @override
  String get loginTitle => 'लगइन';
  @override
  String get welcomeMessage => 'फिर्ता स्वागत छ';
  @override
  String get phoneNumber => 'फोन नम्बर';
  @override
  String get enterYourPhoneNumber => 'आफ्नो फोन नम्बर प्रविष्ट गर्नुहोस्';
  @override
  String get enterYourPassword => 'आफ्नो पासवर्ड प्रविष्ट गर्नुहोस्';
  @override
  String get dontHaveAccount => 'खाता छैन?';
  @override
  String get signUp => 'साइन अप';
  @override
  String get fullName => 'पूरा नाम';
  @override
  String get fullNameHint => 'आफ्नो पूरा नाम प्रविष्ट गर्नुहोस्';
  @override
  String get createProfile => 'प्रोफाइल सिर्जना गर्नुहोस्';
  @override
  String get trendingNews => 'ट्रेंडिङ समाचार';
  @override
  String get newsNotFound => 'कुनै समाचार फेला परेन';
  @override
  String get errorLoadingNews => 'समाचार लोड गर्न त्रुटि';
  @override
  String get retry => 'पुनः प्रयास गर्नुहोस्';
  @override
  String get allCategories => 'सबै श्रेणीहरू';
  @override
  String get newsInNepal => 'नेपालमा समाचार';
  @override
  String get latestUpdates => 'पछिल्लो अपडेट';
  @override
  String get searchForNews => 'समाचार खोज्नुहोस्';
  @override
  String get suggestedCategories => 'सुझावित श्रेणीहरू';
  @override
  String get trendingSearches => 'ट्रेंडिङ खोजहरू';
  @override
  String get searchHistory => 'खोज इतिहास';
  @override
  String get clearHistory => 'इतिहास खाली गर्नुहोस्';
  @override
  String get noSearchHistory => 'कुनै खोज इतिहास छैन';
  @override
  String get noResultsFound => 'कुनै परिणाम फेला परेन';
  @override
  String get tryDifferentKeywords => 'फरक खोजशब्दहरू प्रयास गर्नुहोस्';
}
