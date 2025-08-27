import 'package:chhoto_khabar/features/news_feed/domain/repositories/news_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class BookmarkArticleUseCase {
  final NewsRepository repository;

  const BookmarkArticleUseCase(this.repository);

  Future<Either<AppException, Map<String, dynamic>>> call(String articleId) async {
    return await repository.bookmarkArticle(articleId);
  }
}
