// ==========================================
// 1. main.dart - Application Entry Point
// ==========================================
import 'dart:async';
import 'package:chhoto_khabar/app/app.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
import 'package:chhoto_khabar/core/config/firebase/firebase_api_config.dart';
import 'package:chhoto_khabar/core/theme/cubit/theme_cubit.dart';
import 'package:chhoto_khabar/core/utils/observer.dart';
import 'package:chhoto_khabar/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:chhoto_khabar/firebase_options.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/user/bloc/user_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter/services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Hive.initFlutter();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // Register background handler BEFORE runApp
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);

    await setUpServiceLocator();

    // Set preferred orientations
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    if (kDebugMode) {
      Bloc.observer = AppBlocObserver();
    }

    // Initialize Firebase API for notifications
    final firebaseApi = FirebaseApi();
    await firebaseApi.initNotifications();

    // Initialize theme
    await sl<ThemeCubit>().initialize();

    runApp(
      MultiBlocProvider(
        providers: [
          BlocProvider<LanguageBloc>(
            create: (context) =>
                sl<LanguageBloc>()..add(FetchedSelectedLanguage()),
          ),
          BlocProvider(create: (context) => sl<ThemeCubit>()),
          BlocProvider(create: (context) => sl<UserBloc>()),
          BlocProvider(create: (context) => sl<ProfileBloc>()),
          
          // ... other providers
        ],
        child: MyApp(),
      ),
    );
  }, (error, stackTrace) {
    debugPrint(
        'runZonedGuarded: Caught error in my root zone. $error $stackTrace');
    if (!kDebugMode) {
      FirebaseCrashlytics.instance.recordError(error, stackTrace);
    }
  });
}

// ==========================================
// 5. Usage Example in MyApp
// ==========================================
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'School AI',
//       navigatorKey: navigatorKey,
//       home: NotificationHandlerWidget(
//         child: YourHomeScreen(), // Your actual home screen
//       ),
//       routes: {
//         '/home': (context) => YourHomeScreen(),
//         '/profile': (context) => YourProfileScreen(),
//         '/chat': (context) => YourChatScreen(),
//         '/messages': (context) => YourMessagesScreen(),
//         '/announcement': (context) => YourAnnouncementScreen(),
//       },
//     );
//   }
// }
