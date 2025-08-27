import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/features/bookmark/presentation/bloc/bookmark_bloc.dart';
import 'package:chhoto_khabar/features/bookmark/data/models/bookmark_model.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({Key? key}) : super(key: key);

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage>
    with TickerProviderStateMixin {
  TabController? _tabController;
  String _selectedLanguage = 'en';
  List<String> _categories = [];
  Map<String, List<BookmarkModel>> _groupedBookmarks = {};
  bool _isTabControllerInitialized = false;

  @override
  void initState() {
    super.initState();
    context.read<BookmarkBloc>().add(
      BookmarkEvent.loadBookmarks(page: 1, language: _selectedLanguage),
    );
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _groupBookmarksByCategory(List<BookmarkModel> bookmarks) {
    _groupedBookmarks.clear();
    _categories.clear();

    for (final bookmark in bookmarks) {
      if (bookmark.article.categories.isNotEmpty) {
        for (final category in bookmark.article.categories) {
          // Handle both Map and String formats for category names
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
      } else {
        // If no categories, add to "All" category
        const categoryName = 'All';
        if (!_groupedBookmarks.containsKey(categoryName)) {
          _groupedBookmarks[categoryName] = [];
          _categories.add(categoryName);
        }
        _groupedBookmarks[categoryName]!.add(bookmark);
      }
    }

    // Ensure we have at least one category
    if (_categories.isEmpty && bookmarks.isNotEmpty) {
      _categories.add('All');
      _groupedBookmarks['All'] = bookmarks;
    }

    // Only recreate TabController if we have categories and length changed
    if (_categories.isNotEmpty) {
      if (_tabController?.length != _categories.length) {
        _tabController?.dispose();
        _tabController = TabController(
          length: _categories.length,
          vsync: this,
        );
        _isTabControllerInitialized = true;
      }
    } else {
      _tabController?.dispose();
      _tabController = null;
      _isTabControllerInitialized = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'SAVED FOR LATER',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.orange[800],
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    _selectedLanguage.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Icon(Icons.arrow_drop_down, size: 16),
                ],
              ),
            ),
            onSelected: (language) {
              setState(() {
                _selectedLanguage = language;
                _isTabControllerInitialized = false;
              });
              context.read<BookmarkBloc>().add(
                BookmarkEvent.refreshBookmarks(language: language),
              );
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: 'en',
                child: Text('English'),
              ),
              const PopupMenuItem(
                value: 'np',
                child: Text('नेपाली'),
              ),
            ],
          ),
          const SizedBox(width: 8),
        ],
        bottom: _categories.isNotEmpty && _tabController != null
            ? PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Container(
                  color: Colors.white,
                  child: TabBar(
                    controller: _tabController,
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    labelColor: Colors.black87,
                    unselectedLabelColor: Colors.grey[600],
                    indicatorColor: Colors.orange[600],
                    indicatorWeight: 3,
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    tabs: _categories
                        .map((category) => Tab(text: category))
                        .toList(),
                  ),
                ),
              )
            : null,
      ),
      body: BlocConsumer<BookmarkBloc, BookmarkState>(
        listener: (context, state) {
          state.when(
            initial: () {},
            loading: () {},
            loaded: (bookmarks, currentPage, hasMoreData) {
              setState(() {
                _groupBookmarksByCategory(bookmarks);
              });
            },
            loadingMore: (bookmarks, currentPage) {},
            error: (message) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Error: $message'),
                  backgroundColor: Colors.red[600],
                  behavior: SnackBarBehavior.floating,
                  action: SnackBarAction(
                    label: 'Retry',
                    textColor: Colors.white,
                    onPressed: () {
                      context.read<BookmarkBloc>().add(
                        BookmarkEvent.refreshBookmarks(
                          language: _selectedLanguage,
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          );
        },
        builder: (context, state) {
          return state.when(
            initial: () => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.refresh,
                    size: 48,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Pull to refresh to load bookmarks',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
              ),
            ),
            loaded: (bookmarks, currentPage, hasMoreData) {
              if (bookmarks.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.bookmark_border,
                        size: 80,
                        color: Colors.grey[300],
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'No saved articles',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Articles you bookmark will appear here',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[500],
                        ),
                      ),
                    ],
                  ),
                );
              }

              // Debug: Print to check if we have content
              print('📚 Bookmarks loaded: ${bookmarks.length}');
              for (var bookmark in bookmarks) {
                print('📖 Title content: ${bookmark.article.content.title}');
                print('📝 Summary content: ${bookmark.article.content.summary}');
              }

              return RefreshIndicator(
                color: Colors.orange[600],
                onRefresh: () async {
                  context.read<BookmarkBloc>().add(
                    BookmarkEvent.refreshBookmarks(
                      language: _selectedLanguage,
                    ),
                  );
                },
                child: _categories.isEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Processing bookmarks...',
                              style: TextStyle(
                                color: Colors.grey[600],
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      )
                    : TabBarView(
                        controller: _tabController,
                        children: _categories.map((category) {
                          final categoryBookmarks = 
                              _groupedBookmarks[category] ?? [];
                          
                          return BookmarkListView(
                            bookmarks: categoryBookmarks,
                            language: _selectedLanguage,
                            hasMoreData: hasMoreData,
                            isLoadingMore: false,
                            onLoadMore: () {
                              if (hasMoreData) {
                                context.read<BookmarkBloc>().add(
                                  BookmarkEvent.loadMoreBookmarks(
                                    language: _selectedLanguage,
                                  ),
                                );
                              }
                            },
                          );
                        }).toList(),
                      ),
              );
            },
            loadingMore: (bookmarks, currentPage) {
              if (_tabController == null) {
                return const Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                  ),
                );
              }
              
              return TabBarView(
                controller: _tabController,
                children: _categories.map((category) {
                  final categoryBookmarks = _groupedBookmarks[category] ?? [];
                  
                  return BookmarkListView(
                    bookmarks: categoryBookmarks,
                    language: _selectedLanguage,
                    hasMoreData: true,
                    isLoadingMore: true,
                    onLoadMore: () {},
                  );
                }).toList(),
              );
            },
            error: (message) => Center(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.wifi_off_rounded,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Something went wrong',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: () {
                        context.read<BookmarkBloc>().add(
                          BookmarkEvent.refreshBookmarks(
                            language: _selectedLanguage,
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orange[600],
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Try Again',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ====================
// BOOKMARK LIST VIEW WIDGET
// ====================

class BookmarkListView extends StatefulWidget {
  final List<BookmarkModel> bookmarks;
  final String language;
  final bool hasMoreData;
  final bool isLoadingMore;
  final VoidCallback onLoadMore;

  const BookmarkListView({
    Key? key,
    required this.bookmarks,
    required this.language,
    required this.hasMoreData,
    this.isLoadingMore = false,
    required this.onLoadMore,
  }) : super(key: key);

  @override
  State<BookmarkListView> createState() => _BookmarkListViewState();
}

class _BookmarkListViewState extends State<BookmarkListView> {
  final ScrollController _scrollController = ScrollController();
  bool _isLoadingMore = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(BookmarkListView oldWidget) {
    super.didUpdateWidget(oldWidget);
    
    if (oldWidget.isLoadingMore && !widget.isLoadingMore) {
      _isLoadingMore = false;
    }
  }

  void _onScroll() {
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      
      if (widget.hasMoreData && !widget.isLoadingMore && !_isLoadingMore) {
        setState(() {
          _isLoadingMore = true;
        });
        widget.onLoadMore();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.bookmarks.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.folder_open_outlined,
              size: 64,
              color: Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              'No bookmarks in this category',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      );
    }

    return ListView.separated(
      controller: _scrollController,
      padding: const EdgeInsets.symmetric(vertical: 8),
      itemCount: widget.bookmarks.length + (widget.hasMoreData ? 1 : 0),
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: Colors.grey[200],
        margin: const EdgeInsets.symmetric(horizontal: 16),
      ),
      itemBuilder: (context, index) {
        if (index == widget.bookmarks.length) {
          if (widget.hasMoreData) {
            return Container(
              padding: const EdgeInsets.all(20),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        }

        final bookmark = widget.bookmarks[index];
        return NewsArticleCard(
          bookmark: bookmark,
          language: widget.language,
        );
      },
    );
  }
}

// ====================
// NEWS ARTICLE CARD WIDGET
// ====================

class NewsArticleCard extends StatelessWidget {
  final BookmarkModel bookmark;
  final String language;

  const NewsArticleCard({
    Key? key,
    required this.bookmark,
    required this.language,
  }) : super(key: key);

  String _getLocalizedText(Map<String, String> textMap) {
    // Handle empty maps and fallback to any available text
    if (textMap.isEmpty) return 'No content available';
    
    String? text = textMap[language] ?? textMap['en'];
    
    // If still null, get any available value
    if (text == null || text.isEmpty) {
      final values = textMap.values.where((v) => v.isNotEmpty);
      text = values.isNotEmpty ? values.first : 'No content available';
    }
    
    return text;
  }

  Color _parseColor(String colorCode) {
    try {
      return Color(int.parse(colorCode.substring(1, 7), radix: 16) + 0xFF000000);
    } catch (e) {
      return Colors.grey;
    }
  }

  String _formatTimeAgo(DateTime publishedAt) {
    final now = DateTime.now();
    final difference = now.difference(publishedAt);
    
    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays > 1 ? 's' : ''} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hr${difference.inHours > 1 ? 's' : ''} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} min read';
    } else {
      return 'Just now';
    }
  }

  @override
  Widget build(BuildContext context) {
    final article = bookmark.article;
    final title = _getLocalizedText(article.content.title);
    final summary = _getLocalizedText(article.content.summary);

    return Container(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          // Navigate to article detail page
          // Navigator.pushNamed(context, '/article/${article.slug}');
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Article thumbnail
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                  image: article.image != null
                      ? DecorationImage(
                          image: NetworkImage(article.image!),
                          fit: BoxFit.cover,
                        )
                      : null,
                ),
                child: article.image == null
                    ? Icon(
                        Icons.image_outlined,
                        size: 32,
                        color: Colors.grey[400],
                      )
                    : null,
              ),
              
              const SizedBox(width: 12),
              
              // Article content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Category badge
                    if (article.categories.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: _parseColor(article.categories.first.colorCode)
                              .withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          _getLocalizedText(article.categories.first.name)
                              .toUpperCase(),
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w700,
                            color: _parseColor(article.categories.first.colorCode),
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    
                    const SizedBox(height: 6),
                    
                    // Article title
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 4),
                    
                    // Article summary
                    Text(
                      summary,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    const SizedBox(height: 8),
                    
                    // Article metadata
                    Row(
                      children: [
                        // Time ago
                        Text(
                          article.publishedAt,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        
                        const Spacer(),
                        
                        // Share button
                        InkWell(
                          onTap: () {
                            // Handle share action
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.share_outlined,
                              size: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                        
                        const SizedBox(width: 8),
                        
                        // More options
                        InkWell(
                          onTap: () {
                            _showMoreOptions(context);
                          },
                          borderRadius: BorderRadius.circular(16),
                          child: Padding(
                            padding: const EdgeInsets.all(4),
                            child: Icon(
                              Icons.more_vert,
                              size: 16,
                              color: Colors.grey[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => Container(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            ListTile(
              leading: const Icon(Icons.bookmark_remove_outlined),
              title: const Text('Remove from bookmarks'),
              onTap: () {
                Navigator.pop(context);
                // Handle remove bookmark
              },
            ),
            ListTile(
              leading: const Icon(Icons.share_outlined),
              title: const Text('Share article'),
              onTap: () {
                Navigator.pop(context);
                // Handle share
              },
            ),
            ListTile(
              leading: const Icon(Icons.open_in_new_outlined),
              title: const Text('Open in browser'),
              onTap: () {
                Navigator.pop(context);
                // Handle open in browser
              },
            ),
          ],
        ),
      ),
    );
  }
}