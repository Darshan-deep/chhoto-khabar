import 'package:chhoto_khabar/features/news_feed/domain/entities/article.dart';
import 'package:chhoto_khabar/features/news_feed/domain/repositories/news_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class GetNewsUseCase {
  final NewsRepository repository;

  const GetNewsUseCase(this.repository);

  Future<Either<AppException, NewsResponse>> call({
    int? page,
    String? language,
    String? categorySlug,
  }) async {
    return await repository.getNewsArticles(
      page: page,
      language: language,
      categorySlug: categorySlug,
    );
  }
}
