part of 'bookmark_bloc.dart';

@freezed
class BookmarkEvent with _$BookmarkEvent {
  const factory BookmarkEvent.loadBookmarks({
    int? page,
    String? language,
  }) = LoadBookmarks;
  
  const factory BookmarkEvent.refreshBookmarks({
    String? language,
  }) = RefreshBookmarks;
  
  const factory BookmarkEvent.loadMoreBookmarks({
    String? language,
  }) = LoadMoreBookmarks;
}
