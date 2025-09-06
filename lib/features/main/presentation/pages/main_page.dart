import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';
import 'package:chhoto_khabar/features/comments/presentation/widgets/comments_bottom_sheet.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/presentation/widgets/category_filter_widget.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/news_card.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/share_bottomsheet.dart';
import 'package:chhoto_khabar/features/trending/presentation/pages/trending_page_new.dart';
import 'package:chhoto_khabar/features/profile/presentation/screens/profile_screen.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  PageController _mainPageController = PageController();
  PageController _newsFeedPageController = PageController();
  int _currentMainIndex = 0; // 0 = News Feed, 1 = Trending
  int _currentNewsIndex = 0;
  Category? _selectedCategory;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // Load initial news
    context.read<NewsBloc>().add(const NewsEvent.loadNews());
    // Load initial trending
    context.read<TrendingBloc>().add(const TrendingEvent.loadTrending());
  }

  void _onCategorySelected(Category? category) {
    setState(() {
      _selectedCategory = category;
    });

    // Get current language from language bloc
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

    // Reload news with selected category and current language
    context.read<NewsBloc>().add(NewsEvent.refreshNews(
          categorySlug: category?.slug,
          language: languageCode,
        ));
  }

  void _toggleLike(String articleId) {
    context.read<NewsBloc>().add(NewsEvent.likeArticle(articleId));
    HapticFeedback.lightImpact();
  }

  void _toggleBookmark(String articleId) {
    context.read<NewsBloc>().add(NewsEvent.bookmarkArticle(articleId));
    HapticFeedback.lightImpact();
  }

  void _shareNews(ArticleModel article) async {
    try {
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) => ShareBottomSheet(
          article: article,
        ),
      );
    } catch (e) {
      print('Error opening share bottom sheet: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error sharing: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showComments(ArticleModel article) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => CommentsBottomSheet(
        articleId: article.id,
        onCommentAdded: () {
          // Handle comment added
        },
      ),
    );
  }

  Future<void> _openFullArticle(String? sourceUrl) async {
    if (sourceUrl == null || sourceUrl.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No source URL available'),
          backgroundColor: Colors.orange,
        ),
      );
      return;
    }

    try {
      final Uri uri = Uri.parse(sourceUrl);
      print('Attempting to launch URL: $sourceUrl');

      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
        print('Successfully launched URL: $sourceUrl');
      } else {
        print('Cannot launch URL: $sourceUrl');
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Cannot open article link'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Unable to open article. Please try again.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  String _formatNumber(int number) {
    if (number >= 1000000) {
      return '${(number / 1000000).toStringAsFixed(1)}M';
    } else if (number >= 1000) {
      return '${(number / 1000).toStringAsFixed(1)}K';
    }
    return number.toString();
  }

  int _countWords(String text) {
    return text.trim().split(RegExp(r'\s+')).length;
  }

  Widget _buildNewsFeedPage() {
    return MultiBlocListener(
      listeners: [
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {
            final languageCode =
                LanguageHelper.getApiLanguageCode(state.selectedLanguage);
            context.read<NewsBloc>().add(NewsEvent.refreshNews(
                  language: languageCode,
                  categorySlug: _selectedCategory?.slug,
                ));
          },
        ),
      ],
      child: Column(
        children: [
          // Header with Logo, Title and Drawer Icon
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 22,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                const Text(
                  'Chhoto Khabar',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.5,
                  ),
                ),
                Spacer(),
                // Navigation dots
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _currentMainIndex == 0 ? Colors.white : Colors.white.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: 6),
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: _currentMainIndex == 1 ? Colors.white : Colors.white.withOpacity(0.4),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Category Filter
          CategoryFilterWidget(
            onCategorySelected: _onCategorySelected,
          ),
          // News Feed
          Expanded(
            child: BlocBuilder<NewsBloc, NewsState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                  loading: () => const Center(
                    child: CircularProgressIndicator(color: Colors.white),
                  ),
                  loaded: (articles, hasMoreData, currentPage, nextPageUrl,
                      currentLanguage, currentCategorySlug) {
                    if (articles.isEmpty) {
                      return const Center(
                        child: Text(
                          'No articles available',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      );
                    }

                    return PageView.builder(
                      controller: _newsFeedPageController,
                      scrollDirection: Axis.vertical,
                      onPageChanged: (index) {
                        setState(() {
                          _currentNewsIndex = index;
                        });

                        // Load more articles when reaching near the end
                        if (index >= articles.length - 2 && hasMoreData) {
                          context
                              .read<NewsBloc>()
                              .add(const NewsEvent.loadMoreNews());
                        }
                      },
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final article = articles[index];
                        return GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onHorizontalDragEnd: (details) {
                            // Right swipe - go to trending
                            if (details.primaryVelocity! > 500) {
                              HapticFeedback.mediumImpact();
                              _mainPageController.nextPage(
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            }
                            // Left swipe - launch URL
                            else if (details.primaryVelocity! < -500) {
                              HapticFeedback.mediumImpact();
                              _openFullArticle(article.content.sourceUrl);
                            }
                          },
                          child: BlocBuilder<LanguageBloc, LanguageState>(
                            builder: (context, languageState) {
                              final currentLanguageCode =
                                  LanguageHelper.getApiLanguageCode(
                                      languageState.selectedLanguage);
                              return NewsCard(
                                article: article,
                                onLike: () => _toggleLike(article.id),
                                onComment: () => _showComments(article),
                                onShare: () => _shareNews(article),
                                onBookmark: () => _toggleBookmark(article.id),
                                formatNumber: _formatNumber,
                                currentIndex: _currentNewsIndex,
                                totalItems: articles.length,
                                language: currentLanguageCode,
                                isLongContent: _countWords(article.content
                                            .content[currentLanguageCode] ??
                                        article.content.content['en'] ??
                                        '') >
                                    60,
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
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 64,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error loading news',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          message,
                          style: const TextStyle(color: Colors.white70),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {
                            final currentLanguage = context
                                .read<LanguageBloc>()
                                .state
                                .selectedLanguage;
                            final languageCode =
                                LanguageHelper.getApiLanguageCode(
                                    currentLanguage);

                            context.read<NewsBloc>().add(NewsEvent.refreshNews(
                                  language: languageCode,
                                  categorySlug: _selectedCategory?.slug,
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
    );
  }

  Widget _buildTrendingPage() {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Right swipe to go back to news feed
        if (details.primaryVelocity! > 500) {
          _mainPageController.previousPage(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: Column(
        children: [
          Expanded(
            child: TrendingPageNew(),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.grey[900],
      drawer: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        child: ProfileScreen(),
      ),
      body: SafeArea(
        child: PageView(
          controller: _mainPageController,
          onPageChanged: (index) {
            setState(() {
              _currentMainIndex = index;
            });
          },
          children: [
            _buildNewsFeedPage(),
            _buildTrendingPage(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _mainPageController.dispose();
    _newsFeedPageController.dispose();
    super.dispose();
  }
}
