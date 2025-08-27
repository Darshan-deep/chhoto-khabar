import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

abstract class CommentsRepository {
  Future<Either<AppException, CommentsResponse>> getComments(String articleId, {int page = 1});
  
  Future<Either<AppException, CommentEntity>> postComment({
    required String articleId,
    required String content,
    String? parentId,
  });
}
