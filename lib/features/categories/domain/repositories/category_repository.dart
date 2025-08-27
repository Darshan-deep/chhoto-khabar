import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class CategoryRepository {
  Future<Either<AppException, CategoryResponse>> getCategories();
}
