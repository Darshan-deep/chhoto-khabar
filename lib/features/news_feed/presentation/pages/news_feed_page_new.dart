// import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
// import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';
// import 'package:chhoto_khabar/features/comments/presentation/widgets/comments_bottom_sheet.dart';
// import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
// import 'package:chhoto_khabar/features/categories/presentation/widgets/category_filter_widget.dart';
// import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/news_card.dart';
// import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/share_bottomsheet.dart';
// import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
// import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:url_launcher/url_launcher.dart';

// class NewsFeedPage extends StatefulWidget {
//   const NewsFeedPage({super.key});

//   @override
//   _NewsFeedPageState createState() => _NewsFeedPageState();
// }

// class _NewsFeedPageState extends State<NewsFeedPage> {
//   PageController _pageController = PageController();
//   int _currentIndex = 0;
//   Category? _selectedCategory;

//   @override
//   void initState() {
//     super.initState();
//     // Load initial news
//     context.read<NewsBloc>().add(const NewsEvent.loadNews());
//   }

//   void _onCategorySelected(Category? category) {
//     setState(() {
//       _selectedCategory = category;
//     });

//     // Get current language from language bloc
//     final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
//     final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);

//     // Reload news with selected category and current language
//     context.read<NewsBloc>().add(NewsEvent.refreshNews(
//           categorySlug: category?.slug,
//           language: languageCode,
//         ));
//   }

//   void _toggleLike(String articleId) {
//     context.read<NewsBloc>().add(NewsEvent.likeArticle(articleId));
//     HapticFeedback.lightImpact();
//   }

//   void _toggleBookmark(String articleId) {
//     context.read<NewsBloc>().add(NewsEvent.bookmarkArticle(articleId));
//     HapticFeedback.lightImpact();
//   }

//   void _shareNews(ArticleModel article) async {
//     try {
//       showModalBottomSheet(
//         context: context,
//         backgroundColor: Colors.transparent,
//         builder: (context) => ShareBottomSheet(
//           article: article,
//         ),
//       );
//     } catch (e) {
//       print('Error opening share bottom sheet: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Error sharing: $e'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   void _showComments(ArticleModel article) {
//     showModalBottomSheet(
//       context: context,
//       isScrollControlled: true,
//       backgroundColor: Colors.transparent,
//       builder: (context) => CommentsBottomSheet(
//         articleId: article.id,
//         onCommentAdded: () {
//           // Handle comment added - we don't need to refresh since the
//           // comment count update should be handled separately
//           // Just close the bottom sheet or show a success message
//         },
//       ),
//     );
//   }

//   Future<void> _openFullArticle(String? sourceUrl) async {
//     if (sourceUrl == null || sourceUrl.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('No source URL available'),
//           backgroundColor: Colors.orange,
//         ),
//       );
//       return;
//     }

//     try {
//       final Uri uri = Uri.parse(sourceUrl);
//       print('Attempting to launch URL: $sourceUrl');

//       if (await canLaunchUrl(uri)) {
//         await launchUrl(uri, mode: LaunchMode.externalApplication);
//         print('Successfully launched URL: $sourceUrl');
//       } else {
//         print('Cannot launch URL: $sourceUrl');
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Cannot open article link'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Unable to open article. Please try again.'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   String _formatNumber(int number) {
//     if (number >= 1000000) {
//       return '${(number / 1000000).toStringAsFixed(1)}M';
//     } else if (number >= 1000) {
//       return '${(number / 1000).toStringAsFixed(1)}K';
//     }
//     return number.toString();
//   }

//   int _countWords(String text) {
//     return text.trim().split(RegExp(r'\s+')).length;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MultiBlocListener(
//       listeners: [
//         BlocListener<LanguageBloc, LanguageState>(
//           listener: (context, state) {
//             final languageCode =
//                 LanguageHelper.getApiLanguageCode(state.selectedLanguage);
//             context.read<NewsBloc>().add(NewsEvent.refreshNews(
//                   language: languageCode,
//                   categorySlug: _selectedCategory?.slug,
//                 ));
//           },
//         ),
//       ],
//       child: Scaffold(
//         backgroundColor: Colors.black,
//         appBar: AppBar(
//           backgroundColor: const Color(0xFF1A1A1A),
//           elevation: 2,
//           leading: Padding(
//             padding: const EdgeInsets.all(12.0),
//             child: Image.asset(
//               'assets/logo/horizontal_logo.png',
//               height: 42,
//               fit: BoxFit.contain,
//             ),
//           ),
//           title: const Text(
//             'chhoto khabar',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.w600,
//               letterSpacing: 0.3,
//             ),
//           ),
//           centerTitle: false,
//         ),
//         body: Column(
//           children: [
//             // Category Filter
//             CategoryFilterWidget(
//               onCategorySelected: _onCategorySelected,
//             ),
//             // News Feed
//             Expanded(
//               child: BlocBuilder<NewsBloc, NewsState>(
//                 builder: (context, state) {
//                   return state.when(
//                     initial: () => const Center(
//                       child: CircularProgressIndicator(color: Colors.white),
//                     ),
//                     loading: () => const Center(
//                       child: CircularProgressIndicator(color: Colors.white),
//                     ),
//                     loaded: (articles, hasMoreData, currentPage, nextPageUrl,
//                         currentLanguage, currentCategorySlug) {
//                       if (articles.isEmpty) {
//                         return const Center(
//                           child: Text(
//                             'No articles available',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         );
//                       }

//                       return PageView.builder(
//                         controller: _pageController,
//                         scrollDirection: Axis.vertical,
//                         onPageChanged: (index) {
//                           setState(() {
//                             _currentIndex = index;
//                           });

//                           // Load more articles when reaching near the end
//                           if (index >= articles.length - 2 && hasMoreData) {
//                             context
//                                 .read<NewsBloc>()
//                                 .add(const NewsEvent.loadMoreNews());
//                           }
//                         },
//                         itemCount: articles.length,
//                         itemBuilder: (context, index) {
//                           final article = articles[index];
//                           return GestureDetector(
//                             behavior: HitTestBehavior.opaque,
//                             onHorizontalDragEnd: (details) {
//                               if (details.primaryVelocity! < -500) {
//                                 HapticFeedback.mediumImpact();
//                                 _openFullArticle(article.content.sourceUrl);
//                               }
//                             },
//                             child: BlocBuilder<LanguageBloc, LanguageState>(
//                               builder: (context, languageState) {
//                                 final currentLanguageCode =
//                                     LanguageHelper.getApiLanguageCode(
//                                         languageState.selectedLanguage);
//                                 return NewsCard(
//                                   article: article,
//                                   onLike: () => _toggleLike(article.id),
//                                   onComment: () => _showComments(article),
//                                   onShare: () => _shareNews(article),
//                                   onBookmark: () => _toggleBookmark(article.id),
//                                   formatNumber: _formatNumber,
//                                   currentIndex: _currentIndex,
//                                   totalItems: articles.length,
//                                   language:
//                                       currentLanguageCode, // Pass the current language
//                                   isLongContent: _countWords(article.content
//                                               .content[currentLanguageCode] ??
//                                           article.content.content['en'] ??
//                                           '') >
//                                       60,
//                                 );
//                               },
//                             ),
//                           );
//                         },
//                       );
//                     },
//                     error: (message) => Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.error_outline,
//                             color: Colors.red,
//                             size: 64,
//                           ),
//                           const SizedBox(height: 16),
//                           Text(
//                             'Error loading news',
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Text(
//                             message,
//                             style: const TextStyle(color: Colors.white70),
//                             textAlign: TextAlign.center,
//                           ),
//                           const SizedBox(height: 16),
//                           ElevatedButton(
//                             onPressed: () {
//                               final currentLanguage = context
//                                   .read<LanguageBloc>()
//                                   .state
//                                   .selectedLanguage;
//                               final languageCode =
//                                   LanguageHelper.getApiLanguageCode(
//                                       currentLanguage);

//                               context
//                                   .read<NewsBloc>()
//                                   .add(NewsEvent.refreshNews(
//                                     language: languageCode,
//                                     categorySlug: _selectedCategory?.slug,
//                                   ));
//                             },
//                             child: const Text('Retry'),
//                           ),
//                         ],
//                       ),
//                     ),
//                     actionLoading: () => const Center(
//                       child: CircularProgressIndicator(color: Colors.white),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';
import 'package:chhoto_khabar/features/comments/presentation/widgets/comments_bottom_sheet.dart';
import 'package:chhoto_khabar/features/categories/domain/entities/category.dart';
import 'package:chhoto_khabar/features/categories/presentation/widgets/category_filter_widget.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/news_card.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/share_bottomsheet.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFeedPage extends StatefulWidget {
  const NewsFeedPage({super.key});

  @override
  _NewsFeedPageState createState() => _NewsFeedPageState();
}

class _NewsFeedPageState extends State<NewsFeedPage> {
  PageController _pageController = PageController();
  int _currentIndex = 0;
  Category? _selectedCategory;

  @override
  void initState() {
    super.initState();
    // Load initial news with current language
    final currentLanguage = context.read<LanguageBloc>().state.selectedLanguage;
    final languageCode = LanguageHelper.getApiLanguageCode(currentLanguage);
    context.read<NewsBloc>().add(NewsEvent.loadNews(language: languageCode));
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
          // Handle comment added - we don't need to refresh since the
          // comment count update should be handled separately
          // Just close the bottom sheet or show a success message
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

  @override
  Widget build(BuildContext context) {
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
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        body: SafeArea(
          child: Column(
            children: [
              // Header with Logo and Title
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 8.0),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logo/horizontal_logo.png',
                      height: 30,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(width: 12),
                    const Text(
                      'Chhoto khabar',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.3,
                      ),
                    ),
                    SizedBox(height: 8,),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                                if (details.primaryVelocity! < -500) {
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
                                    onBookmark: () =>
                                        _toggleBookmark(article.id),
                                    formatNumber: _formatNumber,
                                    currentIndex: _currentIndex,
                                    totalItems: articles.length,
                                    language:
                                        currentLanguageCode, // Pass the current language
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

                                context
                                    .read<NewsBloc>()
                                    .add(NewsEvent.refreshNews(
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
        ),
      ),
    );
  }
}
