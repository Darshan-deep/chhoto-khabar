import 'package:chhoto_khabar/features/account_setup/data/datasources/remote/account_setup_datasource.dart';
import 'package:chhoto_khabar/features/account_setup/data/repository/account_setup_repository_impl.dart';
import 'package:chhoto_khabar/features/account_setup/domain/repository/account_setup_repository.dart';
import 'package:chhoto_khabar/features/account_setup/domain/usecases/setup_account_usecase.dart';
import 'package:chhoto_khabar/features/auth/data/datasource/remote/auth_datasource.dart';
import 'package:chhoto_khabar/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:chhoto_khabar/features/auth/domain/repositories/auth_repository.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/logout_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/refresh_token_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/reset_password_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:chhoto_khabar/features/auth/domain/usecases/change_password_usecase.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';

import 'package:chhoto_khabar/features/bookmark/data/datasources/bookmark_datasource.dart';
import 'package:chhoto_khabar/features/bookmark/data/repositories/bookmark_repository_impl.dart';
import 'package:chhoto_khabar/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:chhoto_khabar/features/bookmark/domain/usecases/get_bookmark_usecase.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/bloc/bookmark_bloc.dart';

import 'package:chhoto_khabar/features/news_feed/data/datasources/news_datasource.dart';
import 'package:chhoto_khabar/features/news_feed/data/repositories/news_repository_impl.dart';
import 'package:chhoto_khabar/features/news_feed/domain/repositories/news_repository.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/get_news_usecase.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/like_article_usecase.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/bookmark_article_usecase.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';

import 'package:chhoto_khabar/features/comments/data/datasources/comments_remote_datasource.dart';
import 'package:chhoto_khabar/features/comments/data/repositories/comments_repository_impl.dart';
import 'package:chhoto_khabar/features/comments/domain/repositories/comments_repository.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/get_comments_usecase.dart';
import 'package:chhoto_khabar/features/comments/domain/usecases/post_comment_usecase.dart';
import 'package:chhoto_khabar/features/comments/presentation/bloc/comments_bloc.dart';

import 'package:chhoto_khabar/features/categories/data/datasources/category_datasource.dart';
import 'package:chhoto_khabar/features/categories/data/repositories/category_repository_impl.dart';
import 'package:chhoto_khabar/features/categories/domain/repositories/category_repository.dart';
import 'package:chhoto_khabar/features/categories/domain/usecases/get_categories_usecase.dart';
import 'package:chhoto_khabar/features/categories/presentation/bloc/category_bloc.dart';

import 'package:chhoto_khabar/features/trending/data/datasources/trending_datasource.dart';
import 'package:chhoto_khabar/features/trending/data/repositories/trending_repository_impl.dart';
import 'package:chhoto_khabar/features/trending/domain/repositories/trending_repository.dart';
import 'package:chhoto_khabar/features/trending/domain/usecases/get_trending_news_usecase.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';

import 'package:chhoto_khabar/features/profile/data/datasources/remote/profile_remote_datasource.dart';
import 'package:chhoto_khabar/features/profile/data/datasources/remote/profile_remote_datasource_impl.dart';
import 'package:chhoto_khabar/features/profile/data/repositories/profile_repository_impl.dart';
import 'package:chhoto_khabar/features/profile/data/repositories/category_repository_impl.dart';
import 'package:chhoto_khabar/features/profile/domain/repositories/profile_repository.dart';
import 'package:chhoto_khabar/features/profile/domain/repositories/category_repository.dart';
import 'package:chhoto_khabar/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:chhoto_khabar/features/profile/presentation/blocs/category_bloc/category_bloc.dart';
import 'package:chhoto_khabar/shared/data/local/fcm_token_service.dart';
import 'package:chhoto_khabar/shared/data/local/hive_service.dart';
import 'package:chhoto_khabar/shared/data/local/shared_pref_service.dart';
import 'package:chhoto_khabar/shared/data/local/storage_service.dart';
import 'package:chhoto_khabar/shared/data/local/token_storage_service.dart';
import 'package:chhoto_khabar/shared/data/local/token_storage_service_impl.dart';
import 'package:chhoto_khabar/shared/data/remote/auth_network_service.dart';
import 'package:chhoto_khabar/shared/data/remote/dio_network_service.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/language/data/datasource/local/language_local_datasource.dart';
import 'package:chhoto_khabar/shared/language/data/repositories/language_pref_repo_impl.dart';
import 'package:chhoto_khabar/shared/language/domain/repositories/language_pref_repository.dart';
import 'package:chhoto_khabar/shared/language/domain/usecases/get_selected_language_usecase.dart';
import 'package:chhoto_khabar/shared/language/domain/usecases/set_selected_language_usecase.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/user/bloc/user_bloc.dart';
import 'package:chhoto_khabar/shared/user/data/datasource/local/user_local_datasource.dart';
import 'package:chhoto_khabar/shared/user/data/datasource/remote/user_remote_datasource.dart';
import 'package:chhoto_khabar/shared/user/data/reposiitories/user_remote_repository_impl.dart';
import 'package:chhoto_khabar/shared/user/data/reposiitories/user_repositories_impl.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_remote_repository.dart';
import 'package:chhoto_khabar/shared/user/domain/repository/user_repository.dart';
import 'package:chhoto_khabar/shared/user/domain/usecase/get_remote_user_usecase.dart';
import 'package:chhoto_khabar/shared/user/domain/usecase/check_auth_status_usecase.dart';
import 'package:chhoto_khabar/shared/user/domain/usecase/clear_auth_data_usecase.dart';
import 'package:chhoto_khabar/core/theme/cubit/theme_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

Future<void> setUpServiceLocator() async {
  //-------------------------------------------------------------------------------
  // STEP 1: Register Basic Services (with no dependencies)
  //-------------------------------------------------------------------------------
  
  // Initialize and register SharedPrefsService properly
  final sharedPrefsService = SharedPrefsService();
  await sharedPrefsService.init();
  sl.registerLazySingleton<SharedPrefsService>(() => sharedPrefsService);
  
  // Register other basic services
  sl.registerLazySingleton(() => HiveService());
  sl.registerLazySingleton(() => FCMTokenService());
  sl.registerLazySingleton<TokenStorageService>(() => SecureTokenStorageService());

  // Register abstract StorageService with the initialized SharedPrefsService
  sl.registerLazySingleton<StorageService>(() => sl<SharedPrefsService>());

  // Register Dio instances
  sl.registerLazySingleton<Dio>(() => Dio(), instanceName: 'authDioInstance');
  sl.registerLazySingleton<Dio>(() => Dio(), instanceName: 'jwtDioInstance');

  //-------------------------------------------------------------------------------
  // STEP 2: Register Core Services
  //-------------------------------------------------------------------------------
  sl.registerLazySingleton(() => ThemeCubit(sl<StorageService>()));

  //-------------------------------------------------------------------------------
  // STEP 3: Register User Services
  //-------------------------------------------------------------------------------
  sl.registerLazySingleton<UserLocalDataSource>(
    () => UserLocalDatasourceImpl(storageService: sl<StorageService>()),
  );

  // ✅ UserRepository with SharedPrefsService (same as AuthBloc)
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userLocalDataSource: sl(),
      sharedPrefsService: sl(), // ✅ Same service as AuthBloc
    ),
  );

  //-------------------------------------------------------------------------------
  // STEP 4: Register Network Services
  //-------------------------------------------------------------------------------
  
  // ✅ AuthNetworkService (for login/register - no auth required)
  sl.registerLazySingleton<NetworkService>(
    () => AuthNetworkService(dio: sl<Dio>(instanceName: 'authDioInstance')),
    instanceName: 'authNetworkService',
  );

  // ✅ DioNetworkService (for authenticated requests)
  sl.registerLazySingleton<NetworkService>(
    () => DioNetworkService(
      dio: sl<Dio>(instanceName: 'jwtDioInstance'),
      tokenStorageService: sl<TokenStorageService>(),
      userRepository: sl<UserRepository>(), // ✅ Uses same UserRepository
    ),
    instanceName: 'dioNetworkService',
  );

  // ✅ Register DioNetworkService as concrete type too (for ProfileDataSource)
  sl.registerLazySingleton<DioNetworkService>(
    () => sl<NetworkService>(instanceName: 'dioNetworkService') as DioNetworkService,
  );

  //-------------------------------------------------------------------------------
  // STEP 5: Register Remote Data Sources
  //-------------------------------------------------------------------------------
  
  // ✅ UserRemoteDataSource
  sl.registerLazySingleton<UserRemoteDatasource>(
    () => UserRemoteDatasourceImpl(
      networkService: sl<NetworkService>(instanceName: 'dioNetworkService'),
      userRepository: sl<UserRepository>(),
    ),
  );

  // ✅ AuthRemoteDataSource
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(
        networkService: sl<NetworkService>(instanceName: 'authNetworkService'),
        userRepository: sl<UserRepository>(),
        tokenStorageService: sl<TokenStorageService>(),
        fcmTokenService: sl<FCMTokenService>(),
      ));

  // ✅ ProfileRemoteDataSource
  sl.registerLazySingleton<ProfileRemoteDataSource>(
    () => ProfileRemoteDataSourceImpl(
      networkService: sl<DioNetworkService>(), // ✅ Use authenticated service
    ),
  );

  // ✅ AccountSetupDataSource
  sl.registerLazySingleton<AccountSetupDataSource>(
    () => AccountSetupDataSourceImpl(
      networkService: sl<NetworkService>(instanceName: 'dioNetworkService'),
      tokenStorageService: sl<TokenStorageService>(),
    ),
  );

  // ✅ BOOKMARK DATA SOURCE
  sl.registerLazySingleton<BookmarkDatasource>(
    () => BookmarkDatasourceImpl(
      networkService: sl<NetworkService>(instanceName: 'dioNetworkService'),
    ),
  );

  // ✅ NEWS DATA SOURCE
  sl.registerLazySingleton<NewsDatasource>(
    () => NewsDatasourceImpl(
      networkService: sl<NetworkService>(instanceName: 'dioNetworkService'),
    ),
  );

  // ✅ COMMENTS DATA SOURCE
  sl.registerLazySingleton<CommentsRemoteDataSource>(
    () => CommentsRemoteDataSourceImpl(
      sl<NetworkService>(instanceName: 'dioNetworkService'),
    ),
  );

  // ✅ CATEGORY DATA SOURCE
  sl.registerLazySingleton<CategoryDatasource>(
    () => CategoryDatasourceImpl(
      networkService: sl<NetworkService>(instanceName: 'dioNetworkService'),
    ),
  );

  // ✅ TRENDING DATA SOURCE
  sl.registerLazySingleton<TrendingDatasource>(
    () => TrendingDatasourceImpl(
      networkService: sl<NetworkService>(instanceName: 'dioNetworkService'),
    ),
  );

  //-------------------------------------------------------------------------------
  // STEP 6: Register Repositories
  //-------------------------------------------------------------------------------
  
  // ✅ UserRemoteRepository
  sl.registerLazySingleton<UserRemoteRepository>(
    () => UserRemoteRepositoryImpl(sl<UserRemoteDatasource>()),
  );

  // ✅ AuthRepository
  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl<AuthRemoteDataSource>()),
  );

  // ✅ ProfileRepository
  sl.registerLazySingleton<ProfileRepository>(
    () => ProfileRepositoryImpl(
      remoteDataSource: sl<ProfileRemoteDataSource>(), // ✅ Fixed parameter name
    ),
  );

  // ✅ AccountSetupRepository
  sl.registerLazySingleton<AccountSetupRepository>(
    () => AccountSetupRepositoryImpl(
      accountSetupDataSource: sl<AccountSetupDataSource>(),
      userRepository: sl<UserRepository>(),
    ),
  );

  // ✅ BOOKMARK REPOSITORY
  sl.registerLazySingleton<BookmarkRepository>(
    () => BookmarkRepositoryImpl(sl<BookmarkDatasource>()),
  );

  // ✅ NEWS REPOSITORY
  sl.registerLazySingleton<NewsRepository>(
    () => NewsRepositoryImpl(sl<NewsDatasource>()),
  );

  // ✅ COMMENTS REPOSITORY
  sl.registerLazySingleton<CommentsRepository>(
    () => CommentsRepositoryImpl(sl<CommentsRemoteDataSource>()),
  );

  // ✅ CATEGORY REPOSITORY
  sl.registerLazySingleton<CategoryRepository>(
    () => CategoryRepositoryImpl(sl<CategoryDatasource>()),
  );

  // ✅ TRENDING REPOSITORY
  sl.registerLazySingleton<TrendingRepository>(
    () => TrendingRepositoryImpl(datasource: sl<TrendingDatasource>()),
  );

  //-------------------------------------------------------------------------------
  // STEP 7: Register Language Services
  //-------------------------------------------------------------------------------
  sl.registerLazySingleton<LanguageLocalDataSource>(
    () => LanguageLocalDatasourceImpl(storageService: sl<StorageService>()),
  );

  sl.registerLazySingleton<LanguagePrefRepository>(
    () => LanguagePrefRepoImpl(
        languageLocalDataSource: sl<LanguageLocalDataSource>()),
  );

  //-------------------------------------------------------------------------------
  // STEP 8: Register Use Cases
  //-------------------------------------------------------------------------------
  
  // User Use Cases
  sl.registerLazySingleton(() => GetRemoteUserUsecase(sl<UserRemoteRepository>()));
  sl.registerLazySingleton(() => CheckAuthStatusUsecase(sl<UserRepository>()));
  sl.registerLazySingleton(() => ClearAuthDataUsecase(sl<UserRepository>()));

  // Language Use Cases
  sl.registerLazySingleton(() => GetSelectedLanguageUseCase(sl<LanguagePrefRepository>()));
  sl.registerLazySingleton(() => SetSelectedLanguageUseCase(sl<LanguagePrefRepository>()));

  // Account Setup Use Cases
  sl.registerLazySingleton(() => SetupAccountUseCase(
        accountSetupRepository: sl<AccountSetupRepository>(),
      ));

  // Auth Use Cases
  sl.registerLazySingleton(() => SignInUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SignUpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => ChangePasswordUseCase(sl<AuthRepository>()));

  // ✅ BOOKMARK USE CASES
  sl.registerLazySingleton(() => GetBookmarksUsecase(sl<BookmarkRepository>()));

  // ✅ NEWS USE CASES
  sl.registerLazySingleton(() => GetNewsUseCase(sl<NewsRepository>()));
  sl.registerLazySingleton(() => LikeArticleUseCase(sl<NewsRepository>()));
  sl.registerLazySingleton(() => BookmarkArticleUseCase(sl<NewsRepository>()));

  // ✅ COMMENTS USE CASES
  sl.registerLazySingleton(() => GetCommentsUseCase(sl<CommentsRepository>()));
  sl.registerLazySingleton(() => PostCommentUseCase(sl<CommentsRepository>()));

  // ✅ CATEGORY USE CASES
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl<CategoryRepository>()));

  // ✅ TRENDING USE CASES
  sl.registerLazySingleton(() => GetTrendingNewsUseCase(sl<TrendingRepository>()));

  //-------------------------------------------------------------------------------
  // STEP 9: Register BLoCs (Factory registration)
  //-------------------------------------------------------------------------------
  
  // ✅ LanguageBloc
  sl.registerFactory(() => LanguageBloc(
        getSelectedLanguageUseCase: sl<GetSelectedLanguageUseCase>(),
        setSelectedLanguageUseCase: sl<SetSelectedLanguageUseCase>(),
      ));

  // ✅ UserBloc
  sl.registerFactory<UserBloc>(
    () => UserBloc(
      sl<UserRepository>(),
      sl<GetRemoteUserUsecase>(),
      sl<CheckAuthStatusUsecase>(),
      sl<ClearAuthDataUsecase>(),
    ),
  );

  // ✅ AuthBloc - Fixed to include UserRepository
  sl.registerFactory(() => AuthBloc(
        signInUseCase: sl<SignInUseCase>(),
        signUpUseCase: sl<SignUpUseCase>(),
        logoutUseCase: sl<LogoutUseCase>(),
        forgotPasswordUseCase: sl<ForgotPasswordUseCase>(),
        resetPasswordUseCase: sl<ResetPasswordUseCase>(),
        changePasswordUseCase: sl<ChangePasswordUseCase>(),
        prefsService: sl<SharedPrefsService>(),
        userRepository: sl<UserRepository>(), // ✅ Add this for token saving
      ));

  // ✅ ProfileBloc
  sl.registerFactory(() => ProfileBloc(
        profileRepository: sl<ProfileRepository>(),
        userRepository: sl<UserRepository>(),
      ));

  // ✅ BOOKMARK BLOC
  sl.registerFactory(() => BookmarkBloc(
        getBookmarksUseCase: sl<GetBookmarksUsecase>(),
      ));

  // ✅ NEWS BLOC
  sl.registerFactory(() => NewsBloc(
        getNewsUseCase: sl<GetNewsUseCase>(),
        likeArticleUseCase: sl<LikeArticleUseCase>(),
        bookmarkArticleUseCase: sl<BookmarkArticleUseCase>(),
        languageBloc: sl<LanguageBloc>(),
      ));

  // ✅ COMMENTS BLOC
  sl.registerFactory(() => CommentsBloc(
        sl<GetCommentsUseCase>(),
        sl<PostCommentUseCase>(),
      ));

  // ✅ CATEGORY BLOC
  sl.registerFactory(() => CategoryBloc(
        getCategoriesUseCase: sl<GetCategoriesUseCase>(),
      ));

  // ✅ TRENDING BLOC
  sl.registerFactory(() => TrendingBloc(
        getTrendingNewsUseCase: sl<GetTrendingNewsUseCase>(),
        likeArticleUseCase: sl<LikeArticleUseCase>(),
        bookmarkArticleUseCase: sl<BookmarkArticleUseCase>(),
        languageBloc: sl<LanguageBloc>(),
      ));
}

// ====================
// USAGE IN WIDGET
// ====================

/*
// How to use BookmarkBloc in your widget:

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<BookmarkBloc>()
        ..add(const BookmarkEvent.loadBookmarks(page: 1)),
      child: const BookmarkView(),
    );
  }
}

// Or if using it in a route:
class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/bookmarks':
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => sl<BookmarkBloc>()
              ..add(const BookmarkEvent.loadBookmarks(page: 1)),
            child: const BookmarkPage(),
          ),
        );
      // ... other routes
    }
  }
}

// Or if using it globally in main.dart:
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>(),
        ),
        BlocProvider<UserBloc>(
          create: (context) => sl<UserBloc>(),
        ),
        BlocProvider<BookmarkBloc>(
          create: (context) => sl<BookmarkBloc>(),
        ),
        // ... other blocs
      ],
      child: MaterialApp(
        // ... app configuration
      ),
    );
  }
}
*/