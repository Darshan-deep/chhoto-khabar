import 'package:chhoto_khabar/features/auth/presentation/pages/onboarding_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/patient_login_page.dart';
import 'package:chhoto_khabar/features/auth/presentation/pages/splashscreen.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/pages/bookmark_page.dart';
import 'package:chhoto_khabar/features/categories/presentation/bloc/category_bloc.dart';
import 'package:chhoto_khabar/features/main/presentation/pages/main_page.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
  initialLocation: '/login',
  errorBuilder: (context, state) => Scaffold(
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          Text('Route not found: ${state.uri}'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go('/main'),
            child: const Text('Go to Home'),
          ),
        ],
      ),
    ),
  ),
  routes: <RouteBase>[
    // Root redirect to onboarding
    GoRoute(
      path: '/',
      redirect: (context, state) => '/onboarding',
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
    // Redirect register to login for now since register page is commented out
    GoRoute(
      path: '/register',
      redirect: (context, state) => '/login',
    ),
    // Redirect patient-home to main
    GoRoute(
      path: '/patient-home',
      redirect: (context, state) => '/main',
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

    // Main App - Single Route with Swipe Navigation
    GoRoute(
      path: '/main',
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => sl<NewsBloc>()),
          BlocProvider(create: (context) => sl<TrendingBloc>()),
          BlocProvider(create: (context) => sl<CategoryBloc>()),
        ],
        child: MainPage(),
      ),
    ),
  ],
);
