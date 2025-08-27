part of 'trending_bloc.dart';

@freezed
class TrendingEvent with _$TrendingEvent {
  const factory TrendingEvent.loadTrending({
    int? page,
    String? language,
    String? categorySlug,
    String? search,
    String? ordering,
    int? size,
  }) = LoadTrending;

  const factory TrendingEvent.refreshTrending({
    String? language,
    String? categorySlug,
    String? search,
    String? ordering,
    int? size,
  }) = RefreshTrending;

  const factory TrendingEvent.loadMoreTrending({
    String? language,
    String? categorySlug,
    String? search,
    String? ordering,
    int? size,
  }) = LoadMoreTrending;

  const factory TrendingEvent.likeArticle(String articleId) = LikeTrendingArticle;
  const factory TrendingEvent.bookmarkArticle(String articleId) = BookmarkTrendingArticle;
}
