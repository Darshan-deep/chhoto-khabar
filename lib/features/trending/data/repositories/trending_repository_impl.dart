import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/trending/data/datasources/trending_datasource.dart';
import 'package:chhoto_khabar/features/trending/domain/repositories/trending_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class TrendingRepositoryImpl implements TrendingRepository {
  final TrendingDatasource datasource;

  const TrendingRepositoryImpl({
    required this.datasource,
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
    return await datasource.getTrendingNews(
      page: page,
      language: language,
      categorySlug: categorySlug,
      search: search,
      ordering: ordering,
      size: size,
    );
  }
}
