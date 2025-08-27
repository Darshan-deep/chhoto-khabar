import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class TrendingRepository {
  Future<Either<AppException, NewsResponseModel>> getTrendingNews({
    int? page,
    String? language,
    String? categorySlug,
    String? search,
    String? ordering,
    int? size,
  });
}
