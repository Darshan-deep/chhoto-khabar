import 'package:chhoto_khabar/features/comments/data/models/comment_model.dart';
import 'package:chhoto_khabar/shared/data/remote/network_service.dart';

abstract class CommentsRemoteDataSource {
  Future<CommentsResponseModel> getComments(String articleId, {int page = 1});
  Future<CommentsResponseModel> getCommentReplies(String parentId, {int page = 1});
  Future<CommentModel> postComment({
    required String articleId,
    required String content,
    String? parentId,
  });
}

class CommentsRemoteDataSourceImpl implements CommentsRemoteDataSource {
  final NetworkService _networkService;

  CommentsRemoteDataSourceImpl(this._networkService);

  @override
  Future<CommentsResponseModel> getComments(String articleId, {int page = 1}) async {
    final result = await _networkService.get(
      '/articles/$articleId/comments/',
      queryParameters: {'page': page},
    );

    return result.fold(
      (exception) => throw Exception('Failed to fetch comments: ${exception.message}'),
      (response) => CommentsResponseModel.fromJson(response.data),
    );
  }

  @override
  Future<CommentsResponseModel> getCommentReplies(String parentId, {int page = 1}) async {
    final result = await _networkService.get(
      '/comments/$parentId/replies/',
      queryParameters: {'page': page},
    );

    return result.fold(
      (exception) => throw Exception('Failed to fetch replies: ${exception.message}'),
      (response) => CommentsResponseModel.fromJson(response.data),
    );
  }

  @override
  Future<CommentModel> postComment({
    required String articleId,
    required String content,
    String? parentId,
  }) async {
    final data = {
      'content': content,
      if (parentId != null) 'parent': parentId,
    };

    final result = await _networkService.post(
      '/articles/$articleId/comment/',
      data: data,
    );

    return result.fold(
      (exception) => throw Exception('Failed to post comment: ${exception.message}'),
      (response) => CommentModel.fromJson(response.data),
    );
  }
}
