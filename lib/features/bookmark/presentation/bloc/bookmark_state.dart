part of 'bookmark_bloc.dart';

@freezed
class BookmarkState with _$BookmarkState {
  const factory BookmarkState.initial() = _Initial;
  const factory BookmarkState.loading() = _Loading;
  const factory BookmarkState.loaded({
    required List<BookmarkModel> bookmarks,
    required int currentPage,
    required bool hasMoreData,
  }) = _Loaded;
  const factory BookmarkState.loadingMore({
    required List<BookmarkModel> bookmarks,
    required int currentPage,
  }) = _LoadingMore;
  const factory BookmarkState.error(String message) = _Error;
}