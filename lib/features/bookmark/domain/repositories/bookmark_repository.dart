import 'package:chhoto_khabar/features/bookmark/domain/entities/bookmark.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class BookmarkRepository {
  Future<Either<AppException, List<Bookmark>>> getBookmarks({
    int? page,
    String? language,
  });
}