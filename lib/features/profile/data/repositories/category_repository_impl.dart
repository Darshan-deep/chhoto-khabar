// // features/category/data/repository/category_repository_impl.dart
// import 'package:chhoto_khabar/src/core/locale/language_helper.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:fpdart/fpdart.dart';
// import '../../../../shared/data/remote/auth_network_service.dart';
// import '../../../../shared/data/remote/network_service.dart';
// import '../../../../shared/exceptions/http_exception.dart';
// import '../../../../shared/domain/models/response.dart' as response;
// import '../../../../shared/data/local/category_storage_service.dart';
// import '../../domain/repositories/category_repository.dart';
// import '../models/category_response_model.dart';

// class CategoryRepositoryImpl implements ICategoryRepository {
//   final AuthNetworkService networkService;
//   final CategoryStorageService categoryStorageService;

//   CategoryRepositoryImpl(this.networkService, this.categoryStorageService);

//   @override
//   Future<Either<AppException, CategoryResponse>> getCategories({
//     required int page,
//     required int size,
//     required String language,
//     required forceRefresh,
//   }) async {
//     // Try to get cached categories first (unless force refresh is requested)
//     if (!forceRefresh) {
//       final cachedCategories = await categoryStorageService.getCachedCategories();
//       if (cachedCategories != null) {
//         debugPrint('CategoryRepositoryImpl - Returning cached categories');
//         return Right(cachedCategories);
//       }
//     }

//     // If no cache or force refresh, fetch from API
//     final queryParameters = {
//       'page': page.toString(),
//       'size': size.toString(),
//       'language': language.toString(),
//     };

//     // Update headers with language
//     networkService.updateHeader({'Accept-Language': language});

//     final result = await networkService.get(
//       '/categories',
//       queryParameters: queryParameters,
//     );

//     return result.fold(
//           (exception) => Left(exception),
//           (response) {
//         final categoryResponse = CategoryResponse.fromJson(response.data as Map<String, dynamic>);

//         // Store in cache for future use
//         categoryStorageService.storeCategories(categoryResponse);

//         debugPrint('CategoryRepositoryImpl - Fetched and cached categories from API');
//         return Right(categoryResponse);
//       },
//     );
//   }

//   /// Get categories from cache only
//   @override
//   Future<Either<AppException, CategoryResponse>> getCachedCategories() async {
//     final cachedCategories = await categoryStorageService.getCachedCategories();

//     if (cachedCategories != null) {
//       return Right(cachedCategories);
//     } else {
//       return Left(AppException(
//         message: 'No cached categories available',
//         statusCode: 404, identifier:'No cached categoried',
//       ));
//     }
//   }

//   /// Get category names for UI display
//   @override
//   Future<List<String>> getCategoryNames() async {
//     return await categoryStorageService.getCategoryNames();
//   }

//   /// Clear category cache
//   @override
//   Future<void> clearCache() async {
//     await categoryStorageService.clearCache();
//   }
// }