import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:chhoto_khabar/features/bookmark/data/models/bookmark_model.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:go_router/go_router.dart';

class NewBookmarkPage extends StatefulWidget {
  const NewBookmarkPage({Key? key}) : super(key: key);

  @override
  State<NewBookmarkPage> createState() => _NewBookmarkPageState();
}

class _NewBookmarkPageState extends State<NewBookmarkPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  String _selectedLanguage = 'en';
  List<String> _categories = [];
  Map<String, List<BookmarkModel>> _groupedBookmarks = {};
  bool _isTabControllerInitialized = false;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _initializeLanguage();
    _loadBookmarks();
  }

  void _initializeLanguage() {
    final languageState = context.read<LanguageBloc>().state;
    _selectedLanguage = LanguageHelper.getApiLanguageCode(languageState.selectedLanguage);
  }

  void _loadBookmarks() {
    context.read<BookmarkBloc>().add(
      BookmarkEvent.loadBookmarks(page: 1, language: _selectedLanguage),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _groupBookmarksByCategory(List<BookmarkModel> bookmarks) {
    _groupedBookmarks.clear();
    _categories.clear();

    // Add "All" category first
    _categories.add('All');
    _groupedBookmarks['All'] = bookmarks;

    for (final bookmark in bookmarks) {
      if (bookmark.article.categories.isNotEmpty) {
        for (final category in bookmark.article.categories) {
          String categoryName;
          if (category.name.isNotEmpty) {
            categoryName = category.name[_selectedLanguage] ?? 
                          category.name['en'] ?? 
                          category.name.values.first;
          } else {
            categoryName = 'Uncategorized';
          }
          
          if (!_groupedBookmarks.containsKey(categoryName)) {
            _groupedBookmarks[categoryName] = [];
            _categories.add(categoryName);
          }
          _groupedBookmarks[categoryName]!.add(bookmark);
        }
      }
    }

    // Create TabController
    if (_categories.isNotEmpty && _tabController?.length != _categories.length) {
      _tabController?.dispose();
      _tabController = TabController(
        length: _categories.length,
        vsync: this,
      );
      _isTabControllerInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1A1A),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF1A1A1A),
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => context.pop(),
        ),
        title: const Text(
          'Saved Articles',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          BlocBuilder<LanguageBloc, LanguageState>(
            builder: (context, state) {
              return PopupMenuButton<String>(
                icon: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF2A2A2A),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFF444444)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        LanguageHelper.getApiLanguageCode(state.selectedLanguage).toUpperCase(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(Icons.expand_more, size: 16, color: Colors.white70),
                    ],
                  ),
                ),
                color: const Color(0xFF2A2A2A),
                itemBuilder: (context) => [
                  PopupMenuItem(
                    value: 'en',
                    child: Text(
                      'English',
                      style: TextStyle(
                        color: _selectedLanguage == 'en' ? Colors.orange : Colors.white70,
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    value: 'np',
                    child: Text(
                      'नेपाली',
                      style: TextStyle(
                        color: _selectedLanguage == 'np' ? Colors.orange : Colors.white70,
                      ),
                    ),
                  ),
                ],
                onSelected: (language) {
                  setState(() {
                    _selectedLanguage = language;
                    _isTabControllerInitialized = false;
                  });
                  context.read<BookmarkBloc>().add(
                    BookmarkEvent.refreshBookmarks(language: language),
                  );
                },
              );
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: BlocConsumer<BookmarkBloc, BookmarkState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(message),
                  backgroundColor: Colors.red[600],
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(color: Colors.orange),
            ),
            loaded: (bookmarks, page, hasMore) {
              if (bookmarks.isEmpty) {
                return _buildEmptyState();
              }

              _groupBookmarksByCategory(bookmarks);

              if (!_isTabControllerInitialized || _tabController == null) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                );
              }

              return Column(
                children: [
                  _buildCategoryTabs(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: _categories.map((category) {
                        final categoryBookmarks = _groupedBookmarks[category] ?? [];
                        return _buildBookmarkList(categoryBookmarks);
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
            loadingMore: (bookmarks, page) {
              // Show current bookmarks with loading indicator at bottom
              _groupBookmarksByCategory(bookmarks);
              
              if (!_isTabControllerInitialized || _tabController == null) {
                return const Center(
                  child: CircularProgressIndicator(color: Colors.orange),
                );
              }

              return Column(
                children: [
                  _buildCategoryTabs(),
                  Expanded(
                    child: TabBarView(
                      controller: _tabController,
                      children: _categories.map((category) {
                        final categoryBookmarks = _groupedBookmarks[category] ?? [];
                        return _buildBookmarkListWithLoading(categoryBookmarks);
                      }).toList(),
                    ),
                  ),
                ],
              );
            },
            error: (message) => _buildErrorState(message),
          );
        },
      ),
    );
  }

  Widget _buildCategoryTabs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF1A1A1A),
        border: Border(
          bottom: BorderSide(color: Color(0xFF333333), width: 0.5),
        ),
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: Colors.orange,
        indicatorWeight: 3,
        labelColor: Colors.orange,
        unselectedLabelColor: Colors.white60,
        labelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
        tabs: _categories.map((category) {
          final count = _groupedBookmarks[category]?.length ?? 0;
          return Tab(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(category),
                const SizedBox(width: 6),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    count.toString(),
                    style: const TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildBookmarkList(List<BookmarkModel> bookmarks) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<BookmarkBloc>().add(
          BookmarkEvent.refreshBookmarks(language: _selectedLanguage),
        );
      },
      color: Colors.orange,
      backgroundColor: const Color(0xFF2A2A2A),
      child: ListView.builder(
        controller: _scrollController,
        padding: const EdgeInsets.all(16),
        itemCount: bookmarks.length,
        itemBuilder: (context, index) {
          final bookmark = bookmarks[index];
          return _buildBookmarkCard(bookmark);
        },
      ),
    );
  }

  Widget _buildBookmarkCard(BookmarkModel bookmark) {
    final article = bookmark.article;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF444444), width: 0.5),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to article detail
        },
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Article content
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Category chips
                  if (article.categories.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 4,
                      children: article.categories.take(2).map((category) {
                        String categoryName = category.name[_selectedLanguage] ?? 
                                            category.name['en'] ?? 
                                            category.name.values.first;
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                          decoration: BoxDecoration(
                            color: Colors.orange.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.orange.withOpacity(0.3)),
                          ),
                          child: Text(
                            categoryName,
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  
                  if (article.categories.isNotEmpty) const SizedBox(height: 12),
                  
                  // Title
                  Text(
                    article.content.title['current'] ?? 
                    article.content.title[_selectedLanguage] ?? 
                    article.content.title['en'] ?? 
                    article.content.title.values.first,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Summary
                  Text(
                    article.content.summary['current'] ?? 
                    article.content.summary[_selectedLanguage] ?? 
                    article.content.summary['en'] ?? 
                    article.content.summary.values.first,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.7),
                      fontSize: 14,
                      height: 1.4,
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Meta info
                  Row(
                    children: [
                      // Author info
                      if (article.author != null) ...[
                        CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.orange.withOpacity(0.2),
                          child: Text(
                            article.author.firstName.isNotEmpty
                                ? article.author!.firstName[0].toUpperCase()
                                : 'A',
                            style: const TextStyle(
                              color: Colors.orange,
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '${article.author!.firstName} ${article.author!.lastName}',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(width: 12),
                      ],
                      
                      // Bookmark date
                      Icon(
                        Icons.access_time,
                        size: 14,
                        color: Colors.white.withOpacity(0.4),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        _formatDateString(bookmark.createdAt),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontSize: 12,
                        ),
                      ),
                      
                      const Spacer(),
                      
                      // Actions
                      Row(
                        children: [
                          // Share
                          IconButton(
                            icon: Icon(
                              Icons.share,
                              size: 20,
                              color: Colors.white.withOpacity(0.6),
                            ),
                            onPressed: () {
                              // Implement share
                            },
                            splashRadius: 20,
                          ),
                          
                          // Remove bookmark
                          IconButton(
                            icon: const Icon(
                              Icons.bookmark,
                              size: 20,
                              color: Colors.orange,
                            ),
                            onPressed: () {
                              // Remove bookmark
                              _showRemoveBookmarkDialog(bookmark);
                            },
                            splashRadius: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 80,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            'No Saved Articles',
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Articles you bookmark will appear here',
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: () => context.pop(),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Explore Articles'),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.red.withOpacity(0.7),
          ),
          const SizedBox(height: 16),
          Text(
            'Something went wrong',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            message,
            style: TextStyle(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _loadBookmarks,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.orange,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text('Try Again'),
          ),
        ],
      ),
    );
  }

  void _showRemoveBookmarkDialog(BookmarkModel bookmark) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: const Color(0xFF2A2A2A),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: const Text(
          'Remove Bookmark',
          style: TextStyle(color: Colors.white),
        ),
        content: const Text(
          'Are you sure you want to remove this article from your bookmarks?',
          style: TextStyle(color: Colors.white70),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Cancel',
              style: TextStyle(color: Colors.white70),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Implement remove bookmark
              // You might need to add this to BookmarkBloc
            },
            child: const Text(
              'Remove',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBookmarkListWithLoading(List<BookmarkModel> bookmarks) {
    return Column(
      children: [
        Expanded(child: _buildBookmarkList(bookmarks)),
        Container(
          padding: const EdgeInsets.all(16),
          child: const CircularProgressIndicator(color: Colors.orange),
        ),
      ],
    );
  }

  String _formatDateString(String dateString) {
    try {
      final date = DateTime.parse(dateString);
      return _formatDate(date);
    } catch (e) {
      return 'Recently';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays > 0) {
      return '${difference.inDays}d ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m ago';
    } else {
      return 'Just now';
    }
  }
}
