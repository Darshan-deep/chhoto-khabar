import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';
import 'package:chhoto_khabar/features/comments/presentation/widgets/comments_bottom_sheet.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/presentation/widgets/category_filter_widget.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/news_card.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/share_bottomsheet.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrendingPage extends StatefulWidget {
  const TrendingPage({super.key});

  @override
  _TrendingPageState createState() => _TrendingPageState();
}

class _TrendingPageState extends State<TrendingPage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  Category? _selectedCategory;
  String? _currentSearch;
  String? _currentOrdering;

  @override
  void initState() {
    super.initState();
    // Load initial trending news
    context.read<TrendingBloc>().add(const TrendingEvent.loadTrending());
  }

  void _onCategorySelected(Category? category) {
    setState(() {
      _selectedCategory = category;
    });

    // Get current language from language bloc
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

    // Reload trending with selected category and current language
    context.read<TrendingBloc>().add(TrendingEvent.refreshTrending(
      categorySlug: category?.slug,
      language: languageCode,
      search: _currentSearch,
      ordering: _currentOrdering,
    ));
  }

  void _toggleLike(String articleId) {
    context.read<TrendingBloc>().add(TrendingEvent.likeArticle(articleId));
    HapticFeedback.lightImpact();
  }

  void _toggleBookmark(String articleId) {
    context.read<TrendingBloc>().add(TrendingEvent.bookmarkArticle(articleId));
    HapticFeedback.lightImpact();
  }

  void _showComments(String articleId) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => CommentsBottomSheet(articleId: articleId),
    );
  }

  void _shareArticle(ArticleModel article) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => ShareBottomSheet(article: article),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {
            // When language changes, refresh the trending feed with the new language
            final languageCode = LanguageHelper.getApiLanguageCode(state.selectedLanguage);
            context.read<TrendingBloc>().add(TrendingEvent.refreshTrending(
              language: languageCode, // Explicitly pass the language
              categorySlug: _selectedCategory?.slug,
              search: _currentSearch,
              ordering: _currentOrdering,
            ));
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              // Header with title
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: Colors.white,
                      size: 28,
                    ),
                    const SizedBox(width: 12),
                    Text(
                      AppLocalizations.of(context)!.trendingNews,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    // Search and filter icons can be added here
                    IconButton(
                      onPressed: () {
                        // TODO: Implement search functionality
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),

              // Category Filter
              CategoryFilterWidget(
                onCategorySelected: _onCategorySelected,
              ),

              const SizedBox(height: 12),

              // Content
              Expanded(
                child: BlocBuilder<TrendingBloc, TrendingState>(
                  builder: (context, state) {
                    return state.when(
                      initial: () => const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                      loading: () => const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                      loaded: (articles, hasMoreData, currentPage, nextPageUrl, currentLanguage, currentCategorySlug, currentSearch, currentOrdering) {
                        if (articles.isEmpty) {
                          return const Center(
                            child: Text(
                              'No trending articles available',
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          );
                        }

                        return PageView.builder(
                          controller: _pageController,
                          scrollDirection: Axis.vertical,
                          onPageChanged: (index) {
                            setState(() {
                              _currentIndex = index;
                            });

                            // Load more articles when reaching near the end
                            if (index >= articles.length - 2 && hasMoreData) {
                              context.read<TrendingBloc>().add(const TrendingEvent.loadMoreTrending());
                            }
                          },
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            final article = articles[index];
                            return GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onHorizontalDragEnd: (details) {
                                if (details.primaryVelocity! < -500) {
                                  // Swipe left - like
                                  _toggleLike(article.id);
                                } else if (details.primaryVelocity! > 500) {
                                  // Swipe right - bookmark
                                  _toggleBookmark(article.id);
                                }
                              },
                              child: BlocBuilder<LanguageBloc, LanguageState>(
                                builder: (context, languageState) {
                                  final currentLanguageCode = 
                                      LanguageHelper.getApiLanguageCode(languageState.selectedLanguage);
                                  return NewsCard(
                                    article: article,
                                    onLike: () => _toggleLike(article.id),
                                    onBookmark: () => _toggleBookmark(article.id),
                                    onComment: () => _showComments(article.id),
                                    onShare: () => _shareArticle(article),
                                    formatNumber: (number) => number > 999 ? '${(number / 1000).toStringAsFixed(1)}k' : number.toString(),
                                    currentIndex: index,
                                    totalItems: articles.length,
                                    language: currentLanguageCode, // Pass the current language
                                    isLongContent: (article.content.content[currentLanguageCode]?.length ?? 
                                                   article.content.content['en']?.length ?? 0) > 500,
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                      error: (message) => Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.error_outline,
                              color: Colors.white70,
                              size: 48,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              message,
                              style: const TextStyle(color: Colors.white70),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                // Get current language from language bloc
                                final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
                                final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

                                context.read<TrendingBloc>().add(TrendingEvent.refreshTrending(
                                  language: languageCode,
                                  categorySlug: _selectedCategory?.slug,
                                  search: _currentSearch,
                                  ordering: _currentOrdering,
                                ));
                              },
                              child: const Text('Retry'),
                            ),
                          ],
                        ),
                      ),
                      actionLoading: () => const Center(
                        child: CircularProgressIndicator(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
