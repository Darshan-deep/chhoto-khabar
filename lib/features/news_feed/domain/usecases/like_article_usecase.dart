import 'package:chhoto_khabar/features/news_feed/domain/repositories/news_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class LikeArticleUseCase {
  final NewsRepository repository;

  const LikeArticleUseCase(this.repository);

  Future<Either<AppException, Map<String, dynamic>>> call(String articleId) async {
    return await repository.likeArticle(articleId);
  }
}
