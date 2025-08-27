import 'package:chhoto_khabar/features/bookmark/data/datasources/bookmark_datasource.dart';
import 'package:chhoto_khabar/features/bookmark/domain/entities/bookmark.dart';
import 'package:chhoto_khabar/features/bookmark/domain/repositories/bookmark_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class BookmarkRepositoryImpl implements BookmarkRepository {
  final BookmarkDatasource datasource;

  const BookmarkRepositoryImpl(this.datasource);

  @override
  Future<Either<AppException, List<Bookmark>>> getBookmarks({
    int? page,
    String? language,
  }) async {
    final result = await datasource.getBookmarks(
      page: page,
      language: language,
    );
    
    return result.fold(
      (exception) => Left(exception),
      (models) => Right(models.cast<Bookmark>()),
    );
  }
}
