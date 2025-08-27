import 'dart:io';

final kTestMode = Platform.environment.containsKey('FLUTTER_TEST');
const String userLocalDataSourceKey = 'user';
const String rememberMeKey = 'rememberMe';
const String onboardDatasourceKey = 'onboard';
const String categoryDatasourceKey = 'category';
const String jobDatasourceKey = 'savedJobs';
const String cachedJobsKey = 'cachedJobs';
const String languagePreference = 'language';
