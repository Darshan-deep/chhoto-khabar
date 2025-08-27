part of 'trending_bloc.dart';

@freezed
class TrendingState with _$TrendingState {
  const factory TrendingState.initial() = Initial;
  
  const factory TrendingState.loading() = Loading;
  
  const factory TrendingState.loaded({
    required List<ArticleModel> articles,
    required bool hasMoreData,
    required int currentPage,
    String? nextPageUrl,
    String? currentLanguage,
    String? currentCategorySlug,
    String? currentSearch,
    String? currentOrdering,
  }) = Loaded;
  
  const factory TrendingState.error(String message) = Error;
  
  const factory TrendingState.actionLoading() = ActionLoading;
}
