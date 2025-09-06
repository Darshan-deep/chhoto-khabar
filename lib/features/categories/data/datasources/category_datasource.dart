import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/features/categories/data/models/category_model.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class CategoryDatasource {
  Future<Either<AppException, CategoryResponseModel>> getCategories();
}

class CategoryDatasourceImpl implements CategoryDatasource {
  final NetworkService networkService;

  const CategoryDatasourceImpl({
    required this.networkService,
  });

  @override
  Future<Either<AppException, CategoryResponseModel>> getCategories() async {
    try {
      final response = await networkService.get(ApiConfigs.categories);

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            final data = result.data;
            if (data is Map<String, dynamic>) {
              final categoryResponse = CategoryResponseModel.fromJson(data);
              return Right(categoryResponse);
            } else {
              return Left(
                AppException(
                  message: 'Invalid response format',
                  statusCode: 500,
                  identifier: 'CategoryDatasourceImpl.getCategories.invalidFormat',
                ),
              );
            }
          } catch (e) {
            return Left(
              AppException(
                message: 'Failed to parse categories: ${e.toString()}',
                statusCode: 500,
                identifier: 'CategoryDatasourceImpl.getCategories.parse',
              ),
            );
          }
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to fetch categories: ${e.toString()}',
          statusCode: 500,
          identifier: 'CategoryDatasourceImpl.getCategories',
        ),
      );
    }
  }
}
