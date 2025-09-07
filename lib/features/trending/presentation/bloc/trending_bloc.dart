import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/bookmark_article_usecase.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/like_article_usecase.dart';
import 'package:chhoto_khabar/features/trending/domain/usecases/get_trending_news_usecase.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:chhoto_khabar/shared/utils/auth_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'trending_event.dart';
part 'trending_state.dart';
part 'trending_bloc.freezed.dart';

class TrendingBloc extends Bloc<TrendingEvent, TrendingState> {
  final GetTrendingNewsUseCase getTrendingNewsUseCase;
  final LikeArticleUseCase likeArticleUseCase;
  final BookmarkArticleUseCase bookmarkArticleUseCase;
  final LanguageBloc languageBloc;

  TrendingBloc({
    required this.getTrendingNewsUseCase,
    required this.likeArticleUseCase,
    required this.bookmarkArticleUseCase,
    required this.languageBloc,
  }) : super(const TrendingState.initial()) {
    on<LoadTrending>(_onLoadTrending);
    on<RefreshTrending>(_onRefreshTrending);
    on<LoadMoreTrending>(_onLoadMoreTrending);
    on<LikeTrendingArticle>(_onLikeArticle);
    on<BookmarkTrendingArticle>(_onBookmarkArticle);
  }

  Future<void> _onLoadTrending(
    LoadTrending event,
    Emitter<TrendingState> emit,
  ) async {
    emit(const TrendingState.loading());

    // Get current language from language bloc if not provided
    final currentLanguage = event.language ?? _getLanguageCode();

    final result = await getTrendingNewsUseCase(
      page: event.page ?? 1,
      language: currentLanguage,
      categorySlug: event.categorySlug,
      search: event.search,
      ordering: event.ordering,
      size: event.size,
    );

    result.fold(
      (failure) => emit(TrendingState.error(failure.message)),
      (trendingResponse) => emit(TrendingState.loaded(
        articles: trendingResponse.results.cast<ArticleModel>(),
        currentPage: event.page ?? 1,
        hasMoreData: trendingResponse.next != null,
        nextPageUrl: trendingResponse.next,
        currentLanguage: currentLanguage,
        currentCategorySlug: event.categorySlug,
        currentSearch: event.search,
        currentOrdering: event.ordering,
      )),
    );
  }

  String _getLanguageCode() {
    final currentLanguage = languageBloc.state.selectedLanguage;
    return LanguageHelper.getApiLanguageCode(currentLanguage);
  }

  Future<void> _onRefreshTrending(
    RefreshTrending event,
    Emitter<TrendingState> emit,
  ) async {
    emit(const TrendingState.loading());

    // Get current language from language bloc if not provided
    final currentLanguage = event.language ?? _getLanguageCode();

    final result = await getTrendingNewsUseCase(
      page: 1,
      language: currentLanguage,
      categorySlug: event.categorySlug,
      search: event.search,
      ordering: event.ordering,
      size: event.size,
    );

    result.fold(
      (failure) => emit(TrendingState.error(failure.message)),
      (trendingResponse) => emit(TrendingState.loaded(
        articles: trendingResponse.results.cast<ArticleModel>(),
        currentPage: 1,
        hasMoreData: trendingResponse.next != null,
        nextPageUrl: trendingResponse.next,
        currentLanguage: currentLanguage,
        currentCategorySlug: event.categorySlug,
        currentSearch: event.search,
        currentOrdering: event.ordering,
      )),
    );
  }

  Future<void> _onLoadMoreTrending(
    LoadMoreTrending event,
    Emitter<TrendingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded || !currentState.hasMoreData) return;

    // Use current state's language and parameters for consistency
    final currentLanguage = currentState.currentLanguage ?? _getLanguageCode();
    final currentCategory = currentState.currentCategorySlug;
    final currentSearch = currentState.currentSearch;
    final currentOrdering = currentState.currentOrdering;

    final result = await getTrendingNewsUseCase(
      page: currentState.currentPage + 1,
      language: currentLanguage,
      categorySlug: currentCategory,
      search: currentSearch,
      ordering: currentOrdering,
    );

    result.fold(
      (failure) => emit(TrendingState.error(failure.message)),
      (trendingResponse) => emit(TrendingState.loaded(
        articles: [
          ...currentState.articles,
          ...trendingResponse.results.cast<ArticleModel>(),
        ],
        currentPage: currentState.currentPage + 1,
        hasMoreData: trendingResponse.next != null,
        nextPageUrl: trendingResponse.next,
        currentLanguage: currentLanguage,
        currentCategorySlug: currentCategory,
        currentSearch: currentSearch,
        currentOrdering: currentOrdering,
      )),
    );
  }

  Future<void> _onLikeArticle(
    LikeTrendingArticle event,
    Emitter<TrendingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    final result = await likeArticleUseCase(event.articleId);

    result.fold(
      (failure) => emit(TrendingState.error(failure.message)),
      (likeResponse) {
        final updatedArticles = currentState.articles.map((article) {
          if (article.id == event.articleId) {
            // Create a new ArticleModel with updated like status from Map response
            return ArticleModel(
              id: article.id,
              imageUrl: article.imageUrl,
              isPublished: article.isPublished,
              publishedAt: article.publishedAt,
              categories: article.categories,
              tags: article.tags,
              content: article.content,
              numberOfLikes: likeResponse['number_of_likes'] ?? article.numberOfLikes,
              isLiked: likeResponse['is_liked'] ?? article.isLiked,
              isBookmarked: article.isBookmarked,
              numberOfComments: article.numberOfComments,
              author: article.author,
              slug: article.slug,
              createdAt: article.createdAt,
            );
          }
          return article;
        }).toList();

        emit(TrendingState.loaded(
          articles: updatedArticles,
          currentPage: currentState.currentPage,
          hasMoreData: currentState.hasMoreData,
          nextPageUrl: currentState.nextPageUrl,
          currentLanguage: currentState.currentLanguage,
          currentCategorySlug: currentState.currentCategorySlug,
          currentSearch: currentState.currentSearch,
          currentOrdering: currentState.currentOrdering,
        ));
      },
    );
  }

  Future<void> _onBookmarkArticle(
    BookmarkTrendingArticle event,
    Emitter<TrendingState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    final result = await bookmarkArticleUseCase(event.articleId);

    result.fold(
      (failure) => emit(TrendingState.error(failure.message)),
      (bookmarkResponse) {
        final updatedArticles = currentState.articles.map((article) {
          if (article.id == event.articleId) {
            // Create a new ArticleModel with updated bookmark status from Map response
            return ArticleModel(
              id: article.id,
              imageUrl: article.imageUrl,
              isPublished: article.isPublished,
              publishedAt: article.publishedAt,
              categories: article.categories,
              tags: article.tags,
              content: article.content,
              numberOfLikes: article.numberOfLikes,
              isLiked: article.isLiked,
              isBookmarked: bookmarkResponse['is_bookmarked'] ?? article.isBookmarked,
              numberOfComments: article.numberOfComments,
              author: article.author,
              slug: article.slug,
              createdAt: article.createdAt,
            );
          }
          return article;
        }).toList();

        emit(TrendingState.loaded(
          articles: updatedArticles,
          currentPage: currentState.currentPage,
          hasMoreData: currentState.hasMoreData,
          nextPageUrl: currentState.nextPageUrl,
          currentLanguage: currentState.currentLanguage,
          currentCategorySlug: currentState.currentCategorySlug,
          currentSearch: currentState.currentSearch,
          currentOrdering: currentState.currentOrdering,
        ));
      },
    );
  }
}
