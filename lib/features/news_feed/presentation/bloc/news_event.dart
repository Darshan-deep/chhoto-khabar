part of 'news_bloc.dart';

@freezed
class NewsEvent with _$NewsEvent {
  const factory NewsEvent.loadNews({
    int? page,
    String? language,
    String? categorySlug,
  }) = LoadNews;

  const factory NewsEvent.refreshNews({
    String? language,
    String? categorySlug,
  }) = RefreshNews;

  const factory NewsEvent.loadMoreNews({
    String? language,
    String? categorySlug,
  }) = LoadMoreNews;

  const factory NewsEvent.likeArticle(String articleId) = LikeArticle;

  const factory NewsEvent.bookmarkArticle(String articleId) = BookmarkArticle;
}
