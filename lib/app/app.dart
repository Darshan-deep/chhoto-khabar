import 'package:chhoto_khabar/core/router/app_router.dart';
import 'package:chhoto_khabar/core/theme/cubit/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
import 'package:chhoto_khabar/core/config/size_config/size.config.dart';
import 'package:chhoto_khabar/core/theme/customs/chip_theme.dart';
import 'package:chhoto_khabar/core/theme/customs/color_scheme.dart';
import 'package:chhoto_khabar/core/theme/customs/elevated_button_theme.dart';
import 'package:chhoto_khabar/core/theme/customs/outlined_button_theme.dart';
import 'package:chhoto_khabar/core/utils/snackbra_utils.dart';
import 'package:chhoto_khabar/core/utils/text_scaler.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';
import 'package:chhoto_khabar/shared/bloc/cubit/internet_connection_cubit.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/user/bloc/user_bloc.dart';

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    // Initialize theme on app start
    WidgetsBinding.instance.addPostFrameCallback((_) {
      sl<ThemeCubit>().initialize();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // 🟢 GLOBAL BLOCS - App-wide, always available
        BlocProvider(
          create: (context) => InternetConnectionCubit(),
        ),
        BlocProvider(
          create: (context) => sl<ThemeCubit>(),
        ),
        BlocProvider(
          create: (context) => sl<LanguageBloc>()
            ..add(FetchedSelectedLanguage()),
        ),
        BlocProvider(
          create: (context) => sl<UserBloc>()
            ..add(const UserEvent.checkAuthentication()),
        ),
        // BlocProvider(
        //   create: (context) => sl<AuthBloc>(),
        // ),
      ],
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          return BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, themeState) {
              // Determine theme mode
              ThemeMode themeMode = ThemeMode.system;
              if (themeState is Loaded) {
                themeMode = themeState.themeMode;
              }

              return MaterialApp.router(
                routerConfig: appRouter,
                themeMode: themeMode,
                
                // Light theme
                theme: ThemeData(
                  dividerColor: Colors.transparent,
                  scaffoldBackgroundColor: const Color(0xFFFFFFFF),
                  outlinedButtonTheme: outlinedButtonTheme(lightColorScheme),
                  elevatedButtonTheme: elevatedButtonTheme(context, lightColorScheme),
                  colorScheme: lightColorScheme,
                  chipTheme: CustomChipTheme.lightChipTheme,
                  brightness: Brightness.light,
                ),
                
                // Dark theme
                darkTheme: ThemeData(
                  dividerColor: Colors.transparent,
                  scaffoldBackgroundColor: const Color(0xFF121212),
                  outlinedButtonTheme: outlinedButtonTheme(darkColorScheme),
                  elevatedButtonTheme: elevatedButtonTheme(context, darkColorScheme),
                  colorScheme: darkColorScheme,
                  chipTheme: CustomChipTheme.darkChipTheme,
                  brightness: Brightness.dark,
                ),
                
                debugShowCheckedModeBanner: false,
                locale: languageState.selectedLanguage.value,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                builder: (context, child) {
                  final MediaQueryData data = MediaQuery.of(context);
                  SizeConfig.init(context);
                  return BlocListener<InternetConnectionCubit, InternetConnectionState>(
                    listener: (context, state) {
                      if (state.status == ConnectivityStatus.disconnected) {
                        SnackbarUtils.internetConnectionSnackBar(
                          context, 
                          'No internet connection!'
                        );
                      }
                    },
                    child: MediaQuery(
                      data: data.copyWith(
                        textScaler: TextScaler.linear(
                          ScaleSize.textScaleFactor(context)
                        ),
                      ),
                      child: child!,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}