import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/domain/repositories/comments_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class EditCommentUseCase {
  final CommentsRepository repository;

  const EditCommentUseCase(this.repository);

  Future<Either<AppException, CommentEntity>> call({
    required String commentId,
    required String content,
  }) async {
    return await repository.editComment(
      commentId: commentId,
      content: content,
    );
  }
}
