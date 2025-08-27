import 'package:chhoto_khabar/features/categories/data/datasources/category_datasource.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/domain/repositories/category_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryDatasource datasource;

  const CategoryRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, CategoryResponse>> getCategories() async {
    final result = await datasource.getCategories();
    
    return result.fold(
      (exception) => Left(exception),
      (categoryResponseModel) {
        final categories = categoryResponseModel.results.map((model) => model.toEntity()).toList();
        final categoryResponse = CategoryResponse(
          count: categoryResponseModel.count,
          next: categoryResponseModel.next,
          previous: categoryResponseModel.previous,
          results: categories,
        );
        return Right(categoryResponse);
      },
    );
  }
}
