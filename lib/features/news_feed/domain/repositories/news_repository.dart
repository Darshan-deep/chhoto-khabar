import 'package:chhoto_khabar/features/news_feed/domain/entities/article.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class NewsRepository {
  Future<Either<AppException, NewsResponse>> getNewsArticles({
    int? page,
    String? language,
    String? categorySlug,
  });

  Future<Either<AppException, Map<String, dynamic>>> likeArticle(String articleId);
  
  Future<Either<AppException, Map<String, dynamic>>> bookmarkArticle(String articleId);
}
