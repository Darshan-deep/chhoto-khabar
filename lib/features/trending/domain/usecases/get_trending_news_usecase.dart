import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/trending/domain/repositories/trending_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class GetTrendingNewsUseCase {
  final TrendingRepository repository;

  const GetTrendingNewsUseCase(this.repository);

  Future<Either<AppException, NewsResponseModel>> call({
    int? page,
    String? language,
    String? categorySlug,
    String? search,
    String? ordering,
    int? size,
  }) async {
    return await repository.getTrendingNews(
      page: page,
      language: language,
      categorySlug: categorySlug,
      search: search,
      ordering: ordering,
      size: size,
    );
  }
}
