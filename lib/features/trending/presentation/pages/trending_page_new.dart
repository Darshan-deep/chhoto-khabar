import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';
import 'package:chhoto_khabar/features/categories/presentation/bloc/category_bloc.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:chhoto_khabar/core/widgets/news_shimmer_effects.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';

class TrendingPageNew extends StatefulWidget {
  const TrendingPageNew({super.key});

  @override
  State<TrendingPageNew> createState() => _TrendingPageNewState();
}

class _TrendingPageNewState extends State<TrendingPageNew> {
  final TextEditingController _searchController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _searchFocusNode = FocusNode();
  List<String> _searchHistory = [];
  bool _isSearching = false;
  bool _showSearchResults = false;
  String _currentSearchQuery = '';

  // Trending searches - make these language responsive
  final List<Map<String, dynamic>> _trendingSearches = [
    {'en': 'Climate change', 'ne': 'जलवायु परिवर्तन'},
    {'en': 'Stock market', 'ne': 'शेयर बजार'},
    {'en': 'COVID-19 updates', 'ne': 'कोभिड-१९ अपडेट'},
    {'en': 'Cryptocurrency', 'ne': 'क्रिप्टोकरेन्सी'},
    {'en': 'Olympics', 'ne': 'ओलम्पिक'},
    {'en': 'Election results', 'ne': 'निर्वाचन परिणाम'},
  ];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
    _searchFocusNode.addListener(_onSearchFocusChange);
    _loadSearchHistory();

    // Load initial trending with current language
    _loadTrendingWithCurrentLanguage();

    // Load categories for suggestions
    context.read<CategoryBloc>().add(const CategoryEvent.loadCategories());
  }

  void _loadTrendingWithCurrentLanguage() {
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);
    context
        .read<TrendingBloc>()
        .add(TrendingEvent.loadTrending(language: languageCode));
  }

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<TrendingBloc>().add(const TrendingEvent.loadMoreTrending());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  void _onSearch(String query) {
    if (query.isNotEmpty) {
      setState(() {
        _currentSearchQuery = query;
        _showSearchResults = true;
        _isSearching = false;
      });
      context
          .read<TrendingBloc>()
          .add(TrendingEvent.refreshTrending(search: query));
      _addToSearchHistory(query);
      _searchFocusNode.unfocus();
    }
  }

  void _onSearchFocusChange() {
    setState(() {
      _isSearching = _searchFocusNode.hasFocus;
      if (!_searchFocusNode.hasFocus && _searchController.text.isEmpty) {
        _showSearchResults = false;
        _currentSearchQuery = '';
      }
    });
  }

  void _clearSearch() {
    setState(() {
      _searchController.clear();
      _showSearchResults = false;
      _currentSearchQuery = '';
      _isSearching = false;
    });
    _searchFocusNode.unfocus();
    // Reload original trending content
    context.read<TrendingBloc>().add(const TrendingEvent.refreshTrending());
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('search_history') ?? [];
    setState(() {
      _searchHistory = history;
    });
  }

  Future<void> _addToSearchHistory(String query) async {
    if (query.trim().isEmpty) return;

    final prefs = await SharedPreferences.getInstance();
    List<String> history = prefs.getStringList('search_history') ?? [];

    // Remove if already exists
    history.remove(query);
    // Add to beginning
    history.insert(0, query);
    // Keep only last 10 searches
    if (history.length > 10) {
      history = history.take(10).toList();
    }

    await prefs.setStringList('search_history', history);
    setState(() {
      _searchHistory = history;
    });
  }

  Future<void> _clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
    setState(() {
      _searchHistory = [];
    });
  }

  Future<void> _launchUrl(String? url) async {
    if (url == null || url.isEmpty) return;

    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  String _getTimeAgo(String publishedAt) {
    try {
      final dateTime = DateTime.parse(publishedAt);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 0) {
        return '${difference.inDays} days ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours} hours ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes} minutes ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return 'Unknown';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<LanguageBloc, LanguageState>(
          listener: (context, state) {
            final languageCode =
                LanguageHelper.getApiLanguageCode(state.selectedLanguage);
            context
                .read<TrendingBloc>()
                .add(TrendingEvent.loadTrending(language: languageCode));
          },
        ),
      ],
      child: Scaffold(
        backgroundColor: Colors.grey[50],
        body: Stack(
          children: [
            RefreshIndicator(
              onRefresh: () async {
                final currentLanguage =
                    context.read<LanguageBloc>().state.selectedLanguage;
                final languageCode =
                    LanguageHelper.getApiLanguageCode(currentLanguage);
                context
                    .read<TrendingBloc>()
                    .add(TrendingEvent.refreshTrending(language: languageCode));
              },
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  // Search Bar
                  SliverToBoxAdapter(
                    child: Container(
                      color: Colors.white,
                      padding: const EdgeInsets.fromLTRB(
                          16.0, 50.0, 16.0, 16.0), // Top padding for status bar
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[100],
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey[300]!),
                        ),
                        child: BlocBuilder<LanguageBloc, LanguageState>(
                          builder: (context, languageState) {
                            return TextField(
                              controller: _searchController,
                              focusNode: _searchFocusNode,
                              onSubmitted: _onSearch,
                              style: GoogleFonts.poppins(),
                              decoration: InputDecoration(
                                hintText: AppLocalizations.of(context)
                                        ?.searchForNews ??
                                    'Search for news',
                                hintStyle: GoogleFonts.poppins(
                                    color: Colors.grey[500]),
                                prefixIcon:
                                    Icon(Icons.search, color: Colors.teal),
                                suffixIcon: _searchController.text.isNotEmpty
                                    ? IconButton(
                                        icon: Icon(Icons.clear,
                                            color: Colors.grey),
                                        onPressed: _clearSearch,
                                      )
                                    : null,
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 14),
                              ),
                              onChanged: (value) {
                                setState(
                                    () {}); // Refresh to show/hide clear button
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                  // Conditional Content: Show search results if searching, otherwise show normal content
                  if (_showSearchResults) ...[
                    // Search Results Header
                    SliverToBoxAdapter(
                      child: BlocBuilder<LanguageBloc, LanguageState>(
                        builder: (context, languageState) {
                          final currentLanguage =
                              languageState.selectedLanguage;
                          final languageCode =
                              LanguageHelper.getApiLanguageCode(
                                  currentLanguage);

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  languageCode == 'ne'
                                      ? '"$_currentSearchQuery" को लागि खोज परिणामहरू'
                                      : 'Search results for "$_currentSearchQuery"',
                                  style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 8),
                                BlocBuilder<TrendingBloc, TrendingState>(
                                  builder: (context, state) {
                                    return state.when(
                                      initial: () => Text(
                                        languageCode == 'ne'
                                            ? 'खोजिदै...'
                                            : 'Searching...',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      loading: () => Text(
                                        languageCode == 'ne'
                                            ? 'खोजिदै...'
                                            : 'Searching...',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      loaded: (articles, _, __, ___, ____,
                                          _____, currentSearch, ______) {
                                        if (currentSearch?.isNotEmpty == true) {
                                          return Text(
                                            languageCode == 'ne'
                                                ? '${articles.length} परिणामहरू भेटिए'
                                                : '${articles.length} results found',
                                            style: GoogleFonts.poppins(
                                              fontSize: 14,
                                              color: Colors.grey[600],
                                            ),
                                          );
                                        }
                                        return SizedBox.shrink();
                                      },
                                      error: (message) => Text(
                                        languageCode == 'ne'
                                            ? 'खोजमा त्रुटि भयो'
                                            : 'Search error occurred',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.red,
                                        ),
                                      ),
                                      actionLoading: () => Text(
                                        languageCode == 'ne'
                                            ? 'खोजिदै...'
                                            : 'Searching...',
                                        style: GoogleFonts.poppins(
                                          fontSize: 14,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),

                    // Search Results Grid
                    BlocBuilder<TrendingBloc, TrendingState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => _buildSearchLoadingGrid(),
                          loading: () => _buildSearchLoadingGrid(),
                          loaded: (articles,
                              hasMoreData,
                              currentPage,
                              nextPageUrl,
                              currentLanguage,
                              currentCategorySlug,
                              currentSearch,
                              currentOrdering) {
                            if (currentSearch?.isNotEmpty == true &&
                                articles.isEmpty) {
                              return _buildNoSearchResults();
                            }

                            if (currentSearch?.isNotEmpty == true &&
                                articles.isNotEmpty) {
                              return SliverPadding(
                                padding: EdgeInsets.symmetric(horizontal: 16),
                                sliver: SliverList(
                                  delegate: SliverChildBuilderDelegate(
                                    (context, index) {
                                      if (index >= articles.length) return null;
                                      final article = articles[index];
                                      return _buildSearchResultItem(article);
                                    },
                                    childCount: articles.length,
                                  ),
                                ),
                              );
                            }

                            return SliverToBoxAdapter(child: SizedBox.shrink());
                          },
                          error: (message) => _buildSearchErrorState(message),
                          actionLoading: () => _buildSearchLoadingGrid(),
                        );
                      },
                    ),
                  ] else ...[
                    // Normal Content (Hero Section, Headlines, etc.)
                    // Hero Section
                    SliverToBoxAdapter(
                      child: BlocBuilder<TrendingBloc, TrendingState>(
                        builder: (context, state) {
                          return state.when(
                            initial: () => _buildHeroPlaceholder(),
                            loading: () => _buildHeroPlaceholder(),
                            loaded: (articles,
                                hasMoreData,
                                currentPage,
                                nextPageUrl,
                                currentLanguage,
                                currentCategorySlug,
                                currentSearch,
                                currentOrdering) {
                              if (articles.isEmpty)
                                return _buildHeroPlaceholder();
                              final heroArticle = articles.first;
                              return _buildHeroSection(heroArticle);
                            },
                            error: (message) => _buildHeroPlaceholder(),
                            actionLoading: () => _buildHeroPlaceholder(),
                          );
                        },
                      ),
                    ),

                    // Top Headlines Section
                    SliverToBoxAdapter(
                      child: BlocBuilder<LanguageBloc, LanguageState>(
                        builder: (context, languageState) {
                          final currentLanguage =
                              languageState.selectedLanguage;
                          final languageCode =
                              LanguageHelper.getApiLanguageCode(
                                  currentLanguage);

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  languageCode == 'ne'
                                      ? 'मुख्य समाचारहरू'
                                      : 'Top Headlines',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Handle see all
                                  },
                                  child: Text(
                                    languageCode == 'ne'
                                        ? 'सबै हेर्नुहोस्'
                                        : 'See All',
                                    style: GoogleFonts.poppins(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ), // Headlines Grid
                    BlocBuilder<TrendingBloc, TrendingState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => _buildLoadingGrid(),
                          loading: () => _buildLoadingGrid(),
                          loaded: (articles,
                              hasMoreData,
                              currentPage,
                              nextPageUrl,
                              currentLanguage,
                              currentCategorySlug,
                              currentSearch,
                              currentOrdering) {
                            if (articles.isEmpty) return _buildEmptyState();

                            final headlineArticles =
                                articles.skip(1).take(4).toList();
                            return SliverPadding(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              sliver: SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 12,
                                  mainAxisSpacing: 12,
                                  childAspectRatio: 0.75,
                                ),
                                delegate: SliverChildBuilderDelegate(
                                  (context, index) {
                                    if (index >= headlineArticles.length)
                                      return null;
                                    final article = headlineArticles[index];
                                    return _buildHeadlineCard(article);
                                  },
                                  childCount: headlineArticles.length,
                                ),
                              ),
                            );
                          },
                          error: (message) => _buildErrorState(message),
                          actionLoading: () => _buildLoadingGrid(),
                        );
                      },
                    ),

                    // Notifications Section
                    SliverToBoxAdapter(
                      child: BlocBuilder<LanguageBloc, LanguageState>(
                        builder: (context, languageState) {
                          final currentLanguage =
                              languageState.selectedLanguage;
                          final languageCode =
                              LanguageHelper.getApiLanguageCode(
                                  currentLanguage);

                          return Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  languageCode == 'ne'
                                      ? 'सूचनाहरू'
                                      : 'Notifications',
                                  style: GoogleFonts.poppins(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black87,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Handle view all
                                  },
                                  child: Text(
                                    languageCode == 'ne'
                                        ? 'सबै हेर्नुहोस्'
                                        : 'VIEW ALL',
                                    style: GoogleFonts.poppins(
                                      color: Colors.teal,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ), // Notifications List
                    BlocBuilder<TrendingBloc, TrendingState>(
                      builder: (context, state) {
                        return state.when(
                          initial: () => _buildLoadingNotifications(),
                          loading: () => _buildLoadingNotifications(),
                          loaded: (articles,
                              hasMoreData,
                              currentPage,
                              nextPageUrl,
                              currentLanguage,
                              currentCategorySlug,
                              currentSearch,
                              currentOrdering) {
                            if (articles.isEmpty)
                              return _buildEmptyNotifications();

                            final notificationArticles =
                                articles.skip(5).toList();
                            return SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) {
                                  if (index >= notificationArticles.length)
                                    return null;
                                  final article = notificationArticles[index];
                                  return _buildNotificationItem(article);
                                },
                                childCount: notificationArticles.length,
                              ),
                            );
                          },
                          error: (message) => _buildErrorNotifications(message),
                          actionLoading: () => _buildLoadingNotifications(),
                        );
                      },
                    ),

                    // Bottom padding
                    SliverToBoxAdapter(
                      child: SizedBox(height: 100),
                    ),
                  ], // Close normal content

                  // Bottom padding for all views
                  SliverToBoxAdapter(
                    child: SizedBox(height: 100),
                  ),
                ],
              ),
            ),

            // Enhanced Search Interface
            if (_isSearching)
              Positioned(
                top: 116, // Below search bar
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Suggested Categories Section
                        BlocBuilder<LanguageBloc, LanguageState>(
                          builder: (context, languageState) {
                            final currentLanguage =
                                languageState.selectedLanguage;
                            final languageCode =
                                LanguageHelper.getApiLanguageCode(
                                    currentLanguage);

                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalizations.of(context)
                                          ?.suggestedCategories ??
                                      'Suggested Categories',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 16),
                                // Dynamic categories from API
                                BlocBuilder<CategoryBloc, CategoryState>(
                                  builder: (context, categoryState) {
                                    return categoryState.when(
                                      initial: () => NewsShimmerEffects
                                          .buildCategoryList(),
                                      loading: () => NewsShimmerEffects
                                          .buildCategoryList(),
                                      loaded: (categories, selectedCategory) =>
                                          Wrap(
                                        spacing: 8,
                                        runSpacing: 8,
                                        children:
                                            categories.take(8).map((category) {
                                          final categoryName = languageCode ==
                                                      'ne' &&
                                                  category.name.np.isNotEmpty
                                              ? category.name.np
                                              : category.name.en;
                                          return GestureDetector(
                                            onTap: () {
                                              _searchController.text =
                                                  categoryName;
                                              _onSearch(categoryName);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 8),
                                              decoration: BoxDecoration(
                                                color: Colors.teal,
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                              ),
                                              child: Text(
                                                categoryName,
                                                style: GoogleFonts.poppins(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      error: (message) => Text(
                                        'Failed to load categories',
                                        style: GoogleFonts.poppins(
                                            color: Colors.grey),
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: 32),

                                // Trending Searches Section
                                Text(
                                  AppLocalizations.of(context)
                                          ?.trendingSearches ??
                                      'Trending Searches',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: 16),
                                Column(
                                  children: _trendingSearches.map((search) {
                                    final searchTerm =
                                        search[languageCode] ?? search['en'];
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 12),
                                      child: InkWell(
                                        onTap: () {
                                          _searchController.text = searchTerm;
                                          _onSearch(searchTerm);
                                        },
                                        child: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: 8),
                                          child: Row(
                                            children: [
                                              Icon(
                                                Icons.trending_up,
                                                color: Colors.teal,
                                                size: 20,
                                              ),
                                              SizedBox(width: 12),
                                              Expanded(
                                                child: Text(
                                                  searchTerm,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 16,
                                                    color: Colors.black87,
                                                  ),
                                                ),
                                              ),
                                              Icon(
                                                Icons.arrow_outward,
                                                color: Colors.grey[400],
                                                size: 16,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                ),

                                // Recent Search History (if available)
                                if (_searchHistory.isNotEmpty) ...[
                                  SizedBox(height: 32),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)
                                                ?.searchHistory ??
                                            'Recent Searches',
                                        style: GoogleFonts.poppins(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: _clearSearchHistory,
                                        child: Text(
                                          AppLocalizations.of(context)
                                                  ?.clearHistory ??
                                              'Clear All',
                                          style: GoogleFonts.poppins(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 12,
                                            color: Colors.teal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 12),
                                  Column(
                                    children:
                                        _searchHistory.take(5).map((query) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        child: InkWell(
                                          onTap: () {
                                            _searchController.text = query;
                                            _onSearch(query);
                                          },
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 8),
                                            child: Row(
                                              children: [
                                                Icon(Icons.history,
                                                    color: Colors.grey[400],
                                                    size: 20),
                                                SizedBox(width: 12),
                                                Expanded(
                                                  child: Text(
                                                    query,
                                                    style: GoogleFonts.poppins(
                                                        fontSize: 14),
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () async {
                                                    final prefs =
                                                        await SharedPreferences
                                                            .getInstance();
                                                    List<String> history =
                                                        prefs.getStringList(
                                                                'search_history') ??
                                                            [];
                                                    history.remove(query);
                                                    await prefs.setStringList(
                                                        'search_history',
                                                        history);
                                                    setState(() {
                                                      _searchHistory = history;
                                                    });
                                                  },
                                                  child: Icon(Icons.close,
                                                      color: Colors.grey[400],
                                                      size: 16),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ],
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeroSection(ArticleModel article) {
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

    return Container(
      margin: EdgeInsets.all(16),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.teal[600]!, Colors.teal[800]!],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(16),
          onTap: () => _launchUrl(article.content.sourceUrl),
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppLocalizations.of(context)?.newsInNepal ?? 'News in Nepal',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  AppLocalizations.of(context)?.latestUpdates ??
                      'Latest Updates',
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
                Spacer(),
                Text(
                  article.content.title[languageCode] ??
                      article.content.title['en'] ??
                      'Breaking News',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroPlaceholder() {
    return NewsShimmerEffects.heroArticle(
      height: 200,
      margin: const EdgeInsets.all(16),
    );
  }

  Widget _buildHeadlineCard(ArticleModel article) {
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _launchUrl(article.content.sourceUrl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Expanded(
              flex: 3,
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  color: Colors.grey[200],
                ),
                child: article.imageUrl != null && article.imageUrl!.isNotEmpty
                    ? ClipRRect(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(12)),
                        child: Image.network(
                          article.imageUrl!,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: Colors.grey[200],
                              child: Icon(Icons.image, color: Colors.grey),
                            );
                          },
                        ),
                      )
                    : Container(
                        color: Colors.grey[200],
                        child: Icon(Icons.image, color: Colors.grey),
                      ),
              ),
            ),

            // Content
            Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category
                    if (article.categories.isNotEmpty)
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          article.categories.first.name['en'] ?? 'News',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 8,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    SizedBox(height: 4),

                    // Title
                    Expanded(
                      child: Text(
                        article.content.title[languageCode] ??
                            article.content.title['en'] ??
                            'No title',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(ArticleModel article) {
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: InkWell(
          borderRadius: BorderRadius.circular(8),
          onTap: () => _launchUrl(article.content.sourceUrl),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                // Article content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.content.title[languageCode] ??
                            article.content.title['en'] ??
                            'No title',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          if (article.categories.isNotEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                article.categories.first.name['en'] ??
                                    'World News',
                                style: GoogleFonts.poppins(
                                  color: Colors.teal[700],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          SizedBox(width: 8),
                          Text(
                            _getTimeAgo(article.publishedAt),
                            style: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Article image
                SizedBox(width: 12),
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: article.imageUrl != null &&
                          article.imageUrl!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            article.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: Icon(Icons.image,
                                    color: Colors.grey, size: 20),
                              );
                            },
                          ),
                        )
                      : Container(
                          color: Colors.grey[200],
                          child:
                              Icon(Icons.image, color: Colors.grey, size: 20),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingGrid() {
    return SliverPadding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      sliver: SliverGrid(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.75,
        ),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return NewsShimmerEffects.gridItem(
              aspectRatio: 1.2,
              margin: EdgeInsets.zero,
            );
          },
          childCount: 6,
        ),
      ),
    );
  }

  Widget _buildLoadingNotifications() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          return NewsShimmerEffects.notificationItem();
        },
        childCount: 5,
      ),
    );
  }

  Widget _buildEmptyState() {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.article_outlined, size: 64, color: Colors.grey),
              SizedBox(height: 16),
              Text('No articles available',
                  style: GoogleFonts.poppins(color: Colors.grey)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyNotifications() {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        child: Center(
          child: Text('No notifications',
              style: GoogleFonts.poppins(color: Colors.grey)),
        ),
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return SliverToBoxAdapter(
      child: Container(
        height: 200,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.red),
              SizedBox(height: 16),
              Text('Error: $message',
                  style: GoogleFonts.poppins(color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildErrorNotifications(String message) {
    return SliverToBoxAdapter(
      child: Container(
        height: 100,
        child: Center(
          child: Text('Error loading notifications',
              style: GoogleFonts.poppins(color: Colors.red)),
        ),
      ),
    );
  }

  // Search-related builder methods
  Widget _buildSearchLoadingGrid() {
    return SliverToBoxAdapter(
      child: NewsShimmerEffects.buildGrid(
        itemCount: 6,
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        padding: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildNoSearchResults() {
    return SliverToBoxAdapter(
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          return Container(
            height: 400,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.search_off,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  SizedBox(height: 24),
                  Text(
                    '${AppLocalizations.of(context)?.noResultsFound ?? 'No results found'} "$_currentSearchQuery"',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    AppLocalizations.of(context)?.tryDifferentKeywords ??
                        'Try different keywords',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchResultItem(ArticleModel article) {
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _launchUrl(article.content.sourceUrl),
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Article content
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        article.content.title[languageCode] ??
                            article.content.title['en'] ??
                            'No title',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      if (article.content.summary[languageCode]?.isNotEmpty ==
                              true ||
                          article.content.summary['en']?.isNotEmpty == true)
                        Text(
                          article.content.summary[languageCode] ??
                              article.content.summary['en'] ??
                              '',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          if (article.categories.isNotEmpty)
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                article.categories.first.name[languageCode] ??
                                    article.categories.first.name['en'] ??
                                    'News',
                                style: GoogleFonts.poppins(
                                  color: Colors.teal[700],
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          SizedBox(width: 8),
                          Text(
                            _getTimeAgo(article.publishedAt),
                            style: GoogleFonts.poppins(
                              color: Colors.grey[600],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                // Article image
                SizedBox(width: 12),
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                  ),
                  child: article.imageUrl != null &&
                          article.imageUrl!.isNotEmpty
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            article.imageUrl!,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey[200],
                                child: Icon(Icons.image,
                                    color: Colors.grey, size: 30),
                              );
                            },
                          ),
                        )
                      : Container(
                          color: Colors.grey[200],
                          child:
                              Icon(Icons.image, color: Colors.grey, size: 30),
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSearchErrorState(String message) {
    return SliverToBoxAdapter(
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (context, languageState) {
          final currentLanguage = languageState.selectedLanguage;
          final languageCode =
              LanguageHelper.getApiLanguageCode(currentLanguage);

          return Container(
            height: 200,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text(
                    languageCode == 'ne' ? 'खोजमा त्रुटि भयो' : 'Search Error',
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
