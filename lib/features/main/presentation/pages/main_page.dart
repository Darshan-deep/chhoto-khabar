import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';
import 'package:chhoto_khabar/features/categories/presentation/bloc/category_bloc.dart';
import 'package:chhoto_khabar/features/comments/presentation/widgets/comments_bottom_sheet.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/share_bottomsheet.dart';
import 'package:chhoto_khabar/features/profile/presentation/pages/profile_page_new.dart';
import 'package:chhoto_khabar/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:chhoto_khabar/features/profile/presentation/blocs/profile_bloc/profile_bloc.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:chhoto_khabar/shared/user/bloc/user_bloc.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/core/config/dependency_injection/di_config.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:chhoto_khabar/shared/utils/auth_error_handler.dart';
import 'package:chhoto_khabar/features/main/presentation/widgets/main_header.dart';
import 'package:chhoto_khabar/features/main/presentation/widgets/info_overlay.dart';
import 'package:chhoto_khabar/features/main/presentation/widgets/news_feed_page.dart';
import 'package:chhoto_khabar/features/main/presentation/widgets/trending_page_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool _showInfoOverlay = false;

  @override
  void initState() {
    super.initState();
    // Trigger language fetch first, then load data will be triggered by BlocListener
    context.read<LanguageBloc>().add(const FetchedSelectedLanguage());
    context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
    
    // Load initial articles without category filter
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);
    
    context.read<NewsBloc>().add(NewsEvent.loadNews(
      page: 1,
      language: languageCode,
    ));
    
    // Also load trending articles
    context.read<TrendingBloc>().add(TrendingEvent.loadTrending(
      page: 1,
      language: languageCode,
    ));
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
    return Column(
      children: [
          // Main Header with Logo, Categories, Navigation, Info, Menu
          MainHeader(
            currentMainIndex: _currentMainIndex,
            selectedCategory: _selectedCategory,
            onMenuTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(create: (context) => sl<CategoryBloc>()),
                    BlocProvider(create: (context) => sl<AuthBloc>()),
                    BlocProvider(create: (context) => sl<ProfileBloc>()),
                    BlocProvider(create: (context) => sl<BookmarkBloc>()),
                    BlocProvider.value(value: context.read<LanguageBloc>()),
                    BlocProvider.value(value: context.read<UserBloc>()),
                  ],
                  child: const ProfilePageNew(),
                ),
              ),
            ),
            onInfoTap: () => setState(() => _showInfoOverlay = true),
            onCategorySelected: _onCategorySelected,
          ),
          
          // News Feed
          Expanded(
            child: NewsFeedPage(
              newsFeedPageController: _newsFeedPageController,
              mainPageController: _mainPageController,
              currentNewsIndex: _currentNewsIndex,
              onPageChanged: (index) => setState(() => _currentNewsIndex = index),
              onLike: _toggleLike,
              onBookmark: _toggleBookmark,
              onShare: _shareNews,
              onComment: _showComments,
              formatNumber: _formatNumber,
              countWords: _countWords,
            ),
          ),
        ],
      );
  }

  Widget _buildTrendingPage() {
    return TrendingPageWrapper(
      mainPageController: _mainPageController,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {
            // Load all data when language is loaded or changed
            final languageCode = LanguageHelper.getApiLanguageCode(state.selectedLanguage);
            context.read<NewsBloc>().add(NewsEvent.loadNews(
              language: languageCode,
              categorySlug: _selectedCategory?.slug,
            ));
            context.read<TrendingBloc>().add(TrendingEvent.loadTrending(
              language: languageCode,
            ));
          },
        ),
        BlocListener<NewsBloc, NewsState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                if (AuthErrorHelper.isAuthError(message)) {
                  AuthErrorHelper.showAuthDialog(context, 'interact with articles');
                }
              },
            );
          },
        ),
        BlocListener<TrendingBloc, TrendingState>(
          listener: (context, state) {
            state.whenOrNull(
              error: (message) {
                if (AuthErrorHelper.isAuthError(message)) {
                  AuthErrorHelper.showAuthDialog(context, 'interact with articles');
                }
              },
            );
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: const Color(0xFFE5F2F3),
        body: Stack(
          children: [
            SafeArea(
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
            // Info Overlay
            if (_showInfoOverlay)
              InfoOverlay(
                onClose: () => setState(() => _showInfoOverlay = false),
              ),
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
