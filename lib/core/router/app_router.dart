import 'package:chhoto_khabar/core/config/onboarding/presentation/screens/splash_screen.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/onboarding_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/patient_forgot_password_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/patient_login_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/patient_new_password.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/patient_otp_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/patient_register_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/splashscreen.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/pages/bookmark_page.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/news_feed_page_new.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';
import 'package:chhoto_khabar/features/trending/presentation/pages/trending_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
import 'package:chhoto_khabar/features/profile/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:chhoto_khabar/core/config/navigation/teacher_scaffold_with_navbar.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'root');

CustomTransitionPage<void> buildPageWithDefaultTransition<T>({
  required BuildContext context,
  required GoRouterState state,
  required Widget child,
}) {
  return CustomTransitionPage<T>(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        ),
        child: SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 1),
            end: Offset.zero,
          ).animate(CurvedAnimation(
            parent: animation,
            curve: Curves.easeOutCubic,
          )),
          child: child,
        ),
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  );
}

final GoRouter appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/news-feed',
  routes: <RouteBase>[
    // Splash/Onboarding Routes
    GoRoute(
      path: '/',
      builder: (context, state) => OnboardingPage(),
    ),
    GoRoute(
      path: '/splash-onboard',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: AnimatedSplashScreen(),
      ),
    ),
    GoRoute(
      path: '/onboarding',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: OnboardingPage(),
      ),
    ),

    // Authentication Routes
    GoRoute(
      path: '/login',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => sl<AuthBloc>(),
          child: PatientLogInPage(),
        ),
      ),
    ),
    GoRoute(
      path: '/bookmarks',
      pageBuilder: (context, state) => buildPageWithDefaultTransition(
        context: context,
        state: state,
        child: BlocProvider(
          create: (context) => sl<BookmarkBloc>(),
          child: BookmarkPage(),
        ),
      ),
    ),

    // GoRoute(
    //   path: '/register',
    //   pageBuilder: (context, state) => buildPageWithDefaultTransition(
    //     context: context,
    //     state: state,
    //     child: BlocProvider(
    //       create: (context) => sl<AuthBloc>(),
    //       child: PatientRegisterPage(),
    //     ),
    //   ),
    // ),

    // GoRoute(
    //   path: '/forgot-password',
    //   pageBuilder: (context, state) => buildPageWithDefaultTransition(
    //     context: context,
    //     state: state,
    //     child: BlocProvider(
    //       create: (context) => sl<AuthBloc>(),
    //       child: PatientForgotPasswordPage(),
    //     ),
    //   ),
    // ),

    // GoRoute(
    //   path: '/otp',
    //   pageBuilder: (context, state) {
    //     final extras = state.extra as Map<String, String>? ?? {};
    //     return buildPageWithDefaultTransition(
    //       context: context,
    //       state: state,
    //       child: BlocProvider(
    //         create: (context) => sl<AuthBloc>(),
    //         child: PatientOtpScreen(
    //           nextRoute: extras['nextRoute'] ?? '',
    //         ),
    //       ),
    //     );
    //   },
    // ),

    // GoRoute(
    //   path: '/new-password',
    //   pageBuilder: (context, state) {
    //     final extra = state.extra as Map<String, dynamic>?;
    //     return buildPageWithDefaultTransition(
    //       context: context,
    //       state: state,
    //       child: BlocProvider(
    //         create: (context) => sl<AuthBloc>(),
    //         child: PatientNewPasswordPage(
    //           phone: extra?['phone'] as String? ?? '',
    //         ),
    //       ),
    //     );
    //   },
    // ),

    // Main App Navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          StudentScaffoldWithNavBar(studentNavigationShell: navigationShell),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          initialLocation: '/news-feed',
          routes: [
            GoRoute(
              path: '/news-feed',
              builder: (context, state) => BlocProvider(
                create: (context) => sl<NewsBloc>(),
                child: NewsFeedPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/trending',
              builder: (context, state) => BlocProvider(
                create: (context) => sl<TrendingBloc>(),
                child: TrendingPage(),
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/profile',
              builder: (context, state) {
                return ProfileScreen();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);
