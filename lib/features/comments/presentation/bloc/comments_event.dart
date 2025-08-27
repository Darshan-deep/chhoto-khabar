part of 'comments_bloc.dart';

@freezed
class CommentsEvent with _$CommentsEvent {
  const factory CommentsEvent.loadComments(String articleId) = LoadComments;
  const factory CommentsEvent.loadMoreComments(String articleId) = LoadMoreComments;
  const factory CommentsEvent.postComment({
    required String articleId,
    required String content,
    String? parentId,
  }) = PostComment;
  const factory CommentsEvent.refreshComments(String articleId) = RefreshComments;
}
