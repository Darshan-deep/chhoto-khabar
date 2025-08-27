import 'package:chhoto_khabar/features/news_feed/data/datasources/news_datasource.dart';
import 'package:chhoto_khabar/features/news_feed/domain/entities/article.dart';
import 'package:chhoto_khabar/features/news_feed/domain/repositories/news_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class NewsRepositoryImpl implements NewsRepository {
  final NewsDatasource datasource;

  const NewsRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, NewsResponse>> getNewsArticles({
    int? page,
    String? language,
    String? categorySlug,
  }) async {
    final result = await datasource.getNewsArticles(
      page: page,
      language: language,
      categorySlug: categorySlug,
    );
    
    return result.fold(
      (exception) => Left(exception),
      (newsResponse) => Right(newsResponse),
    );
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>> likeArticle(String articleId) async {
    final result = await datasource.likeArticle(articleId);
    
    return result.fold(
      (exception) => Left(exception),
      (likeResponse) => Right(likeResponse),
    );
  }

  @override
  Future<Either<AppException, Map<String, dynamic>>> bookmarkArticle(String articleId) async {
    final result = await datasource.bookmarkArticle(articleId);
    
    return result.fold(
      (exception) => Left(exception),
      (bookmarkResponse) => Right(bookmarkResponse),
    );
  }
}
