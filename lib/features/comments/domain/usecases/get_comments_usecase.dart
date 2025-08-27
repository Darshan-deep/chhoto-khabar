import 'package:chhoto_khabar/features/comments/domain/entities/comment.dart';
import 'package:chhoto_khabar/features/comments/domain/repositories/comments_repository.dart';
import 'package:chhoto_khabar/shared/exceptions/http_exception.dart';
import 'package:fpdart/fpdart.dart';

class GetCommentsUseCase {
  final CommentsRepository repository;

  const GetCommentsUseCase(this.repository);

  Future<Either<AppException, CommentsResponse>> call(String articleId, {int page = 1}) async {
    return await repository.getComments(articleId, page: page);
  }
}
