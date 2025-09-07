import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/domain/repositories/comments_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class GetCommentRepliesUseCase {
  final CommentsRepository repository;

  const GetCommentRepliesUseCase(this.repository);

  Future<Either<AppException, CommentsResponse>> call(String parentId, {int page = 1}) async {
    return await repository.getCommentReplies(parentId, page: page);
  }
}
