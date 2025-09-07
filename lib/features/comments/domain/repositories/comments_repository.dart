import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class CommentsRepository {
  Future<Either<AppException, CommentsResponse>> getComments(String articleId, {int page = 1});
  
  Future<Either<AppException, CommentsResponse>> getCommentReplies(String parentId, {int page = 1});
  
  Future<Either<AppException, CommentEntity>> postComment({
    required String articleId,
    required String content,
    String? parentId,
  });

  Future<Either<AppException, CommentEntity>> editComment({
    required String commentId,
    required String content,
  });
}
