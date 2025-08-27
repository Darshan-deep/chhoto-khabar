import 'package:chhoto_khabar/features/comments/data/datasources/comments_remote_datasource.dart';
import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/domain/repositories/comments_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class CommentsRepositoryImpl implements CommentsRepository {
  final CommentsRemoteDataSource _remoteDataSource;

  CommentsRepositoryImpl(this._remoteDataSource);

  @override
  Future<Either<AppException, CommentsResponse>> getComments(String articleId, {int page = 1}) async {
    try {
      final response = await _remoteDataSource.getComments(articleId, page: page);
      return Right(response);
    } catch (e) {
      return Left(AppException(
        message: 'Failed to fetch comments: $e',
        statusCode: 500,
        identifier: 'COMMENTS_FETCH_ERROR',
      ));
    }
  }

  @override
  Future<Either<AppException, CommentEntity>> postComment({
    required String articleId,
    required String content,
    String? parentId,
  }) async {
    try {
      final response = await _remoteDataSource.postComment(
        articleId: articleId,
        content: content,
        parentId: parentId,
      );
      return Right(response);
    } catch (e) {
      return Left(AppException(
        message: 'Failed to post comment: $e',
        statusCode: 500,
        identifier: 'COMMENT_POST_ERROR',
      ));
    }
  }
}
