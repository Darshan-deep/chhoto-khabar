import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class TrendingDatasource {
  Future<Either<AppException, NewsResponseModel>> getTrendingNews({
    int? page,
    String? language,
    String? categorySlug,
    String? search,
    String? ordering,
    int? size,
  });
}

class TrendingDatasourceImpl implements TrendingDatasource {
  final NetworkService networkService;

  const TrendingDatasourceImpl({
    required this.networkService,
  });

  @override
  Future<Either<AppException, NewsResponseModel>> getTrendingNews({
    int? page,
    String? language,
    String? categorySlug,
    String? search,
    String? ordering,
    int? size,
  }) async {
    try {
      final queryParameters = <String, dynamic>{
        'is_mobile_only': 'false',
      };
      
      if (page != null) queryParameters['page'] = page;
      if (language != null) queryParameters['language'] = language;
      if (categorySlug != null) queryParameters['categories__slug'] = categorySlug;
      if (search != null) queryParameters['search'] = search;
      if (ordering != null) queryParameters['ordering'] = ordering;
      if (size != null) queryParameters['size'] = size;

      final response = await networkService.get(
        '/articles/trending/',
        queryParameters: queryParameters,
      );

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            final data = result.data;
            print('🔥 Raw trending API response type: ${data.runtimeType}');
            print('🔥 Raw trending API response keys: ${data is Map ? data.keys : 'Not a Map'}');

            if (data is Map<String, dynamic>) {
              print('🔥 Processing trending news response...');
              final trendingResponse = NewsResponseModel.fromJson(data);
              print('✅ Successfully parsed ${trendingResponse.results.length} trending articles');
              return Right(trendingResponse);
            } else {
              print('❌ Invalid trending response format - not a Map<String, dynamic>');
              return Left(
                AppException(
                  message: 'Invalid response format',
                  statusCode: result.statusCode,
                  identifier: 'TrendingDatasourceImpl.getTrendingNews.invalidFormat',
                ),
              );
            }
          } catch (e) {
            print('❌ Error parsing trending news: $e');
            return Left(
              AppException(
                message: 'Failed to parse trending news: ${e.toString()}',
                statusCode: result.statusCode,
                identifier: 'TrendingDatasourceImpl.getTrendingNews.parse',
              ),
            );
          }
        },
      );
    } catch (e) {
      print('❌ Error fetching trending news: $e');
      return Left(
        AppException(
          message: 'Failed to fetch trending news: ${e.toString()}',
          statusCode: 500,
          identifier: 'TrendingDatasourceImpl.getTrendingNews',
        ),
      );
    }
  }
}
