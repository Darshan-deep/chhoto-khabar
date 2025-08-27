import 'package:chhoto_khabar/features/bookmark/domain/entities/bookmark.dart';
import 'package:chhoto_khabar/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class GetBookmarksUsecase {
  final BookmarkRepository repository;

  const GetBookmarksUsecase(this.repository);

  Future<Either<AppException, List<Bookmark>>> call({
    int? page,
    String? language,
  }) async {
    return await repository.getBookmarks(
      page: page,
      language: language,
    );
  }
}