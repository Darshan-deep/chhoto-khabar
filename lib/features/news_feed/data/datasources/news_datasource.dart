import 'package:chhoto_khabar/core/config/api/api_configs.dart';
import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class NewsDatasource {
  Future<Either<AppException, NewsResponseModel>> getNewsArticles({
    int? page,
    String? language,
    String? categorySlug,
  });

  Future<Either<AppException, Map<String, dynamic>>> likeArticle(String articleId);
  
  Future<Either<AppException, Map<String, dynamic>>> bookmarkArticle(String articleId);
}class NewsDatasourceImpl implements NewsDatasource {
  final NetworkService networkService;

  const NewsDatasourceImpl({
    required this.networkService,
  });

  @override
  Future<Either<AppException, NewsResponseModel>> getNewsArticles({
    int? page,
    String? language,
    String? categorySlug,
  }) async {
    try {
      final queryParameters = <String, dynamic>{};
      if (page != null) queryParameters['page'] = page;
      if (language != null) queryParameters['language'] = language;
      if (categorySlug != null) queryParameters['categories__slug'] = categorySlug;

      final response = await networkService.get(
        ApiConfigs.articles,
        queryParameters: queryParameters,
      );

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            final data = result.data;
            print('🔍 Raw API response type: ${data.runtimeType}');
            print(
                '🔍 Raw API response keys: ${data is Map ? data.keys : 'Not a Map'}');

            if (data is Map<String, dynamic>) {
              print('🔍 Processing news response...');
              final newsResponse = NewsResponseModel.fromJson(data);
              print(
                  '✅ Successfully parsed ${newsResponse.results.length} articles');
              return Right(newsResponse);
            } else {
              print('❌ Invalid response format - not a Map<String, dynamic>');
              return Left(
                AppException(
                  message: 'Invalid response format',
                  statusCode: 500,
                  identifier:
                      'NewsDatasourceImpl.getNewsArticles.invalidFormat',
                ),
              );
            }
          } catch (e, stackTrace) {
            print('❌ Parse error: $e');
            print('❌ Stack trace: $stackTrace');
            return Left(
              AppException(
                message: 'Failed to parse news data: ${e.toString()}',
                statusCode: 500,
                identifier: 'NewsDatasourceImpl.getNewsArticles.parse',
              ),
            );
          }
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to fetch news articles: ${e.toString()}',
          statusCode: 500,
          identifier: 'NewsDatasourceImpl.getNewsArticles',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>> likeArticle(
      String articleId) async {
    try {
      final response = await networkService.post(
        '${ApiConfigs.articles}$articleId/like-toggle/',
      );

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            final data = result.data;
            if (data is Map<String, dynamic>) {
              // Return the like response data directly
              return Right({
                'article_id': articleId,
                'is_liked': data['is_liked'] ?? false,
                'number_of_likes': data['number_of_likes'] ?? 0,
                'message': data['message'] ?? 'Article liked',
              });
            } else {
              return Left(
                AppException(
                  message: 'Invalid response format',
                  statusCode: 500,
                  identifier: 'NewsDatasourceImpl.likeArticle.invalidFormat',
                ),
              );
            }
          } catch (e) {
            return Left(
              AppException(
                message: 'Failed to parse like response: ${e.toString()}',
                statusCode: 500,
                identifier: 'NewsDatasourceImpl.likeArticle.parse',
              ),
            );
          }
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to like article: ${e.toString()}',
          statusCode: 500,
          identifier: 'NewsDatasourceImpl.likeArticle',
        ),
      );
    }
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>> bookmarkArticle(
      String articleId) async {
    try {
      final response = await networkService.post(
        '${ApiConfigs.articles}$articleId/bookmark-toggle/',
      );

      return response.fold(
        (exception) => Left(exception),
        (result) {
          try {
            final data = result.data;
            if (data is Map<String, dynamic>) {
              // Return the bookmark response data directly
              return Right({
                'article_id': articleId,
                'is_bookmarked': data['is_bookmarked'] ?? false,
                'message': data['message'] ?? 'Bookmark toggled',
              });
            } else {
              return Left(
                AppException(
                  message: 'Invalid response format',
                  statusCode: 500,
                  identifier:
                      'NewsDatasourceImpl.bookmarkArticle.invalidFormat',
                ),
              );
            }
          } catch (e) {
            return Left(
              AppException(
                message: 'Failed to parse bookmark response: ${e.toString()}',
                statusCode: 500,
                identifier: 'NewsDatasourceImpl.bookmarkArticle.parse',
              ),
            );
          }
        },
      );
    } catch (e) {
      return Left(
        AppException(
          message: 'Failed to bookmark article: ${e.toString()}',
          statusCode: 500,
          identifier: 'NewsDatasourceImpl.bookmarkArticle',
        ),
      );
    }
  }
}
