import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/bookmark_article_usecase.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/get_news_usecase.dart';
import 'package:chhoto_khabar/features/news_feed/domain/usecases/like_article_usecase.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:chhoto_khabar/shared/utils/auth_error_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'news_event.dart';
part 'news_state.dart';
part 'news_bloc.freezed.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final GetNewsUseCase getNewsUseCase;
  final LikeArticleUseCase likeArticleUseCase;
  final BookmarkArticleUseCase bookmarkArticleUseCase;
  final LanguageBloc languageBloc;

  NewsBloc({
    required this.getNewsUseCase,
    required this.likeArticleUseCase,
    required this.bookmarkArticleUseCase,
    required this.languageBloc,
  }) : super(const NewsState.initial()) {
    on<LoadNews>(_onLoadNews);
    on<RefreshNews>(_onRefreshNews);
    on<LoadMoreNews>(_onLoadMoreNews);
    on<LikeArticle>(_onLikeArticle);
    on<BookmarkArticle>(_onBookmarkArticle);
  }

  Future<void> _onLoadNews(
    LoadNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState.loading());

    // Get current language from language bloc if not provided
    final currentLanguage = event.language ?? _getLanguageCode();

    final result = await getNewsUseCase(
      page: event.page,
      language: currentLanguage,
      categorySlug: event.categorySlug,
    );

    result.fold(
      (failure) => emit(NewsState.error(failure.message)),
      (newsResponse) => emit(NewsState.loaded(
        articles: newsResponse.results.cast<ArticleModel>(),
        currentPage: event.page ?? 1,
        hasMoreData: newsResponse.next != null,
        nextPageUrl: newsResponse.next,
        currentLanguage: currentLanguage,
        currentCategorySlug: event.categorySlug,
      )),
    );
  }

  String _getLanguageCode() {
    final currentLanguage = languageBloc.state.selectedLanguage;
    return LanguageHelper.getApiLanguageCode(currentLanguage);
  }

  Future<void> _onRefreshNews(
    RefreshNews event,
    Emitter<NewsState> emit,
  ) async {
    emit(const NewsState.loading());

    // Get current language from language bloc if not provided
    final currentLanguage = event.language ?? _getLanguageCode();

    final result = await getNewsUseCase(
      page: 1,
      language: currentLanguage,
      categorySlug: event.categorySlug,
    );

    result.fold(
      (failure) => emit(NewsState.error(failure.message)),
      (newsResponse) => emit(NewsState.loaded(
        articles: newsResponse.results.cast<ArticleModel>(),
        currentPage: 1,
        hasMoreData: newsResponse.next != null,
        nextPageUrl: newsResponse.next,
        currentLanguage: currentLanguage,
        currentCategorySlug: event.categorySlug,
      )),
    );
  }

  Future<void> _onLoadMoreNews(
    LoadMoreNews event,
    Emitter<NewsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded || !currentState.hasMoreData) return;

    // Use current state's language and category for consistency
    final currentLanguage = currentState.currentLanguage ?? _getLanguageCode();
    final currentCategory = currentState.currentCategorySlug;

    final result = await getNewsUseCase(
      page: currentState.currentPage + 1,
      language: currentLanguage,
      categorySlug: currentCategory,
    );

    result.fold(
      (failure) => emit(NewsState.error(failure.message)),
      (newsResponse) => emit(NewsState.loaded(
        articles: [
          ...currentState.articles,
          ...newsResponse.results.cast<ArticleModel>(),
        ],
        currentPage: currentState.currentPage + 1,
        hasMoreData: newsResponse.next != null,
        nextPageUrl: newsResponse.next,
        currentLanguage: currentLanguage,
        currentCategorySlug: currentCategory,
      )),
    );
  }

  Future<void> _onLikeArticle(
    LikeArticle event,
    Emitter<NewsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    final result = await likeArticleUseCase(event.articleId);

    result.fold(
      (failure) => emit(NewsState.error(failure.message)),
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

        emit(NewsState.loaded(
          articles: updatedArticles,
          currentPage: currentState.currentPage,
          hasMoreData: currentState.hasMoreData,
          nextPageUrl: currentState.nextPageUrl,
          currentLanguage: currentState.currentLanguage,
          currentCategorySlug: currentState.currentCategorySlug,
        ));
      },
    );
  }

  Future<void> _onBookmarkArticle(
    BookmarkArticle event,
    Emitter<NewsState> emit,
  ) async {
    final currentState = state;
    if (currentState is! Loaded) return;

    final result = await bookmarkArticleUseCase(event.articleId);

    result.fold(
      (failure) => emit(NewsState.error(failure.message)),
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

        emit(NewsState.loaded(
          articles: updatedArticles,
          currentPage: currentState.currentPage,
          hasMoreData: currentState.hasMoreData,
          nextPageUrl: currentState.nextPageUrl,
          currentLanguage: currentState.currentLanguage,
          currentCategorySlug: currentState.currentCategorySlug,
        ));
      },
    );
  }
}
