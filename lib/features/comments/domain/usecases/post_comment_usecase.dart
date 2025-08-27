import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/domain/repositories/comments_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class PostCommentUseCase {
  final CommentsRepository repository;

  const PostCommentUseCase(this.repository);

  Future<Either<AppException, CommentEntity>> call({
    required String articleId,
    required String content,
    String? parentId,
  }) async {
    return await repository.postComment(
      articleId: articleId,
      content: content,
      parentId: parentId,
    );
  }
}
