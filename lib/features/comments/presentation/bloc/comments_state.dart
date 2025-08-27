part of 'comments_bloc.dart';

@freezed
class CommentsState with _$CommentsState {
  const factory CommentsState.initial() = _Initial;
  const factory CommentsState.loading() = _Loading;
  const factory CommentsState.loaded({
    required List<CommentEntity> comments,
    required bool hasMore,
    required int currentPage,
  }) = _Loaded;
  const factory CommentsState.error(String message) = _Error;
  const factory CommentsState.posting() = _Posting;
  const factory CommentsState.posted(CommentEntity comment) = _Posted;
}
