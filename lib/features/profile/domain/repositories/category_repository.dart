// features/category/domain/repository/category_repository.dart
import 'package:fpdart/fpdart.dart';

import '../../../../shared/exceptions/http_exception.dart';
import '../../data/models/category_response_model.dart';

abstract class ICategoryRepository {
  Future<Either<AppException, CategoryResponse>> getCategories({
    required int page,
    required int size,
    required String language,
    required forceRefresh,
  });
  Future<Either<AppException, CategoryResponse>> getCachedCategories();
  Future<List<String>> getCategoryNames();
  clearCache();
}