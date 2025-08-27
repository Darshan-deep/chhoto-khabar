part of 'news_bloc.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = Initial;
  
  const factory NewsState.loading() = Loading;
  
  const factory NewsState.loaded({
    required List<ArticleModel> articles,
    required bool hasMoreData,
    required int currentPage,
    String? nextPageUrl,
    String? currentLanguage,
    String? currentCategorySlug,
  }) = Loaded;
  
  const factory NewsState.error(String message) = Error;
  
  const factory NewsState.actionLoading() = ActionLoading;
}
