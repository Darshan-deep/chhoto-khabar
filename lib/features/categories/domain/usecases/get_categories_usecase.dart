import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/domain/repositories/category_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  const GetCategoriesUseCase(this.repository);

  Future<Either<AppException, List<Category>>> call() async {
    final result = await repository.getCategories();
    
    return result.fold(
      (exception) => Left(exception),
      (categoryResponse) => Right(categoryResponse.results),
    );
  }
}
