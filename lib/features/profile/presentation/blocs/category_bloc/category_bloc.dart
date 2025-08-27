// // features/category/bloc/category_bloc.dart
// import 'package:flutter/foundation.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../config/di/injection_container.dart';
// import '../../../../../core/locale/language_helper.dart';
// import '../../../domain/repositories/category_repository.dart';
// import 'category_event.dart';
// import 'category_state.dart';

// class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
//   final ICategoryRepository categoryRepository;
//   LanguageHelper _languageHelper = getIt<LanguageHelper>();

//   CategoryBloc({required this.categoryRepository}) : super(CategoryInitial()) {
//     // Debug: Log bloc creation
//     debugPrint('CategoryBloc created with initial state: ${state.runtimeType}');

//     on<FetchCategories>(_onFetchCategories);
//     on<RefreshCategories>(_onRefreshCategories);
//     on<LoadCachedCategories>(_onLoadCachedCategories);
//   }

//   Future<void> _onFetchCategories(FetchCategories event, Emitter<CategoryState> emit) async {
//     debugPrint('CategoryBloc - Fetch categories requested');

//     emit(CategoryLoading());

//     try {
//       final result = await categoryRepository.getCategories(
//         page: event.page ?? 1,
//         size: event.size ?? 20,
//         language: _languageHelper.currentLanguage,
//         forceRefresh: event.forceRefresh ?? false,
//       );

//       await result.fold(
//             (failure) async {
//           debugPrint('CategoryBloc - Fetch categories failed: ${failure.message}');

//           // Check if it's a validation error and extract the specific message
//           String errorMessage = failure.message;
//           if (failure.validationError != null) {
//             // Get the first error message from validation errors
//             errorMessage = failure.validationError!.firstErrorMessage;
//             debugPrint('CategoryBloc - Validation error message: $errorMessage');
//           }

//           emit(CategoryError(errorMessage));

//           // Auto clear error state after 3 seconds
//           await Future.delayed(const Duration(seconds: 3));
//           if (state is CategoryError) {
//             emit(CategoryInitial());
//           }
//         },
//             (categoryResponse) async {
//           debugPrint('CategoryBloc - Fetch categories successful');
//           emit(CategoryLoaded(categoryResponse));
//         },
//       );
//     } catch (e) {
//       debugPrint('CategoryBloc - Unexpected fetch categories error: $e');
//       emit(CategoryError('An unexpected error occurred. Please try again.'));

//       // Auto clear error state after 3 seconds
//       await Future.delayed(const Duration(seconds: 3));
//       if (state is CategoryError) {
//         emit(CategoryInitial());
//       }
//     }
//   }

//   Future<void> _onRefreshCategories(RefreshCategories event, Emitter<CategoryState> emit) async {
//     debugPrint('CategoryBloc - Refresh categories requested');

//     // For refresh, force fetch from API
//     add(FetchCategories(
//       language: event.language,
//       forceRefresh: true,
//     ));
//   }

//   Future<void> _onLoadCachedCategories(LoadCachedCategories event, Emitter<CategoryState> emit) async {
//     debugPrint('CategoryBloc - Load cached categories requested');

//     try {
//       final result = await categoryRepository.getCachedCategories();

//       result.fold(
//             (failure) {
//           debugPrint('CategoryBloc - No cached categories available');
//           // Don't emit error, just stay in initial state
//           // The UI can handle this by showing fallback or fetching from API
//         },
//             (categoryResponse) {
//           debugPrint('CategoryBloc - Cached categories loaded successfully');
//           emit(CategoryLoaded(categoryResponse));
//         },
//       );
//     } catch (e) {
//       debugPrint('CategoryBloc - Error loading cached categories: $e');
//       // Don't emit error for cache loading failure
//     }
//   }

//   @override
//   void onTransition(Transition<CategoryEvent, CategoryState> transition) {
//     super.onTransition(transition);
//     debugPrint('CategoryBloc - Transition: ${transition.event.runtimeType} -> ${transition.nextState.runtimeType}');
//   }
// }