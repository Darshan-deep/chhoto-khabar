// // screens/search_screen.dart
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../config/router/app_router.dart';
// import '../../../../presentation/_widget/bottom_nav_bar.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// import '../../../news/data/models/article_model.dart';
// import '../../../news/presentation/blocs/article_bloc/article_bloc.dart';
// import '../../../news/presentation/blocs/article_bloc/article_event.dart';
// import '../../../news/presentation/blocs/article_bloc/article_state.dart';
// import '../blocs/category_bloc/category_bloc.dart';
// import '../blocs/category_bloc/category_event.dart';
// import '../blocs/category_bloc/category_state.dart';

// @RoutePage()
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({Key? key}) : super(key: key);

//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }

// class _SearchScreenState extends State<SearchScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   bool _isSearching = false;
//   String _searchQuery = '';
//   bool _hasInitializedTrending = false;
//   bool _hasInitializedCategories = false;

//   // Sample trending searches
//   final List<String> _trendingSearches = [
//     'Climate change', 'Stock market', 'COVID-19 updates',
//     'Cryptocurrency', 'Olympics', 'Election results'
//   ];

//   // Sample search results for notifications - in a real app this would come from an API
//   final List<Map<String, dynamic>> _notificationResults = [
//     {
//       'title': 'Trump imposes tariffs on Antarctic islands where only penguin & seals live',
//       'source': 'World News',
//       'time': '2 hours ago',
//       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M5T8Q6waMeTcge0cMzk3MDE=/nepali-cricket-supporters-fans-shield-themselves-umbrella-1500w-13893790i.jpg',
//     },
//     {
//       'title': 'China urges US to immediately cancel tariffs, vows retaliation',
//       'source': 'Business',
//       'time': '4 hours ago',
//       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M5T8Q6waMeTcge0cMzk3MDE=/nepali-cricket-supporters-fans-shield-themselves-umbrella-1500w-13893790i.jpg',
//     },
//     {
//       'title': 'Waqf Bill brought in Rajya Sabha after Lok Sabha passes it',
//       'source': 'Politics',
//       'time': '1 day ago',
//       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M5T8Q6waMeTcge0cMzk3MDE=/nepali-cricket-supporters-fans-shield-themselves-umbrella-1500w-13893790i.jpg',
//     },
//     {
//       'title': 'When Manoj Kumar sued SRK for \'disrespecting\' him, sought ₹100 cr',
//       'source': 'Entertainment',
//       'time': '2 days ago',
//       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M8T0Qbw5MfT6gf0bMzk3MDU=/nepali-cricket-players-along-last-remaining-uae-1500w-13893790k.jpg',
//     },
//   ];

//   @override
//   void initState() {
//     super.initState();
//     // Initialize trending articles and categories when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _initializeTrendingArticles();
//       _initializeCategories();
//     });
//   }

//   void _initializeTrendingArticles() {
//     if (!_hasInitializedTrending) {
//       context.read<ArticleBloc>().add(const FetchTrendingArticles());
//       _hasInitializedTrending = true;
//     }
//   }

//   void _initializeCategories() {
//     if (!_hasInitializedCategories) {
//       // First try to load cached categories
//       context.read<CategoryBloc>().add(const LoadCachedCategories());

//       // Then fetch fresh categories in background
//       context.read<CategoryBloc>().add(const FetchCategories());
//       _hasInitializedCategories = true;
//     }
//   }

//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }

//   void _startSearch() {
//     setState(() {
//       _isSearching = true;
//     });
//   }

//   void _stopSearch() {
//     setState(() {
//       _isSearching = false;
//       _searchQuery = '';
//       _searchController.clear();
//     });
//     // Clear search results
//     context.read<ArticleBloc>().add(const ClearSearch());
//   }

//   void _onSearchQueryChanged(String query) {
//     setState(() {
//       _searchQuery = query;
//     });

//     // Trigger search if query is not empty
//     if (query.trim().isNotEmpty) {
//       context.read<ArticleBloc>().add(SearchArticles(query: query));
//     } else {
//       context.read<ArticleBloc>().add(const ClearSearch());
//     }
//   }

//   void _onSearchItemTap(ArticleModel article) {
//     // Navigate to NewsScreen with the selected article
//     context.router.push(NewsRoute(
//       initialArticle: article,
//       viewMode: ArticleViewMode.search,
//     ));
//   }

//   void _onTrendingItemTap(ArticleModel article) {
//     // Navigate to NewsScreen with the selected trending article
//     context.router.push(NewsRoute(
//       initialArticle: article,
//       viewMode: ArticleViewMode.trending,
//     ));
//   }

//   void _onTrendingSearchTap(String searchTerm) {
//     _searchController.text = searchTerm;
//     _onSearchQueryChanged(searchTerm);
//   }

//   void _onCategoryTap(String categoryName) {
//     _searchController.text = categoryName;
//     _onSearchQueryChanged(categoryName);
//   }

//   // Handler for left swipe navigation
//   void _handleLeftSwipe() {
//     context.router.push(NewsRoute());
//   }

//   // Helper method to get fallback categories with proper localization
//   List<String> _getFallbackCategories(BuildContext context) {
//     final l10n = AppLocalizations.of(context)!;
//     return [
//       l10n.politics,
//       l10n.business,
//       l10n.technology,
//       l10n.health,
//       l10n.science,
//       l10n.sports,
//       l10n.entertainment,
//       l10n.world
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final l10n = AppLocalizations.of(context)!;

//     return GestureDetector(
//       // Detect horizontal swipes
//       onHorizontalDragEnd: (details) {
//         // Detect left swipe
//         if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
//           _handleLeftSwipe();
//         }
//       },
//       child: Scaffold(
//         backgroundColor: theme.colorScheme.background,
//         body: SafeArea(
//           child: Column(
//             children: [
//               // Search bar
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: TextField(
//                   controller: _searchController,
//                   decoration: InputDecoration(
//                     hintText: l10n.searchForNews,
//                     hintStyle: theme.textTheme.bodyMedium?.copyWith(
//                       color: theme.colorScheme.onSurface.withOpacity(0.6),
//                     ),
//                     prefixIcon: Icon(
//                       Icons.search,
//                       color: theme.colorScheme.primary,
//                     ),
//                     suffixIcon: _isSearching
//                         ? IconButton(
//                       icon: Icon(
//                         Icons.clear,
//                         color: theme.colorScheme.primary,
//                       ),
//                       onPressed: _stopSearch,
//                     )
//                         : null,
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(12.0),
//                       borderSide: BorderSide.none,
//                     ),
//                     filled: true,
//                     fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
//                   ),
//                   onChanged: _onSearchQueryChanged,
//                   onTap: _startSearch,
//                   style: theme.textTheme.bodyMedium,
//                 ),
//               ),

//               // Promotional banner
//               if (!_isSearching) _buildPromoBanner(theme, l10n),

//               // Content based on search state
//               Expanded(
//                 child: BlocBuilder<ArticleBloc, ArticleState>(
//                   builder: (context, state) {
//                     if (_isSearching && _searchQuery.isNotEmpty) {
//                       return _buildSearchResults(state, theme, l10n);
//                     } else if (_isSearching) {
//                       return _buildSearchSuggestions(theme, l10n);
//                     } else {
//                       return _buildContentWithTrendingArticles(state, theme, l10n);
//                     }
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPromoBanner(ThemeData theme, AppLocalizations l10n) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
//       child: Container(
//         height: 120,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(16),
//           gradient: LinearGradient(
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//             colors: [
//               theme.colorScheme.primaryContainer,
//               theme.colorScheme.secondaryContainer,
//             ],
//           ),
//         ),
//         child: Row(
//           children: [
//             const SizedBox(width: 20),
//             Expanded(
//               flex: 2,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     l10n.newsInNepal,
//                     style: theme.textTheme.titleLarge?.copyWith(
//                       fontWeight: FontWeight.bold,
//                       color: theme.colorScheme.onPrimaryContainer,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.tertiary.withOpacity(0.2),
//                       borderRadius: BorderRadius.circular(16),
//                     ),
//                     child: Text(
//                       l10n.latestUpdates,
//                       style: theme.textTheme.labelSmall?.copyWith(
//                         color: theme.colorScheme.onSecondaryContainer,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               flex: 1,
//               child: Container(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildContentWithTrendingArticles(ArticleState state, ThemeData theme, AppLocalizations l10n) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Top Headlines section with trending articles
//           _buildTrendingArticlesSection(state, theme, l10n),

//           const SizedBox(height: 16),

//           // Notifications section (keep as sample data)
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   l10n.notifications,
//                   style: theme.textTheme.titleLarge?.copyWith(
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 Text(
//                   l10n.viewAll,
//                   style: theme.textTheme.labelMedium?.copyWith(
//                     color: theme.colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           // Notification items (sample data)
//           ..._notificationResults.map((result) => _buildNotificationItem(result, theme, l10n)),
//         ],
//       ),
//     );
//   }

//   Widget _buildTrendingArticlesSection(ArticleState state, ThemeData theme, AppLocalizations l10n) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Section header
//         Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 l10n.topHeadlines,
//                 style: theme.textTheme.titleLarge?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               if (state.trendingArticles.isNotEmpty)
//                 Text(
//                   l10n.viewAll,
//                   style: theme.textTheme.labelMedium?.copyWith(
//                     color: theme.colorScheme.primary,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//             ],
//           ),
//         ),

//         // Trending articles content
//         if (state.status == ArticleStatus.loading && state.trendingArticles.isEmpty)
//           const Center(
//             child: Padding(
//               padding: EdgeInsets.all(32.0),
//               child: CircularProgressIndicator(),
//             ),
//           )
//         else if (state.trendingArticles.isEmpty)
//           Padding(
//             padding: const EdgeInsets.all(32.0),
//             child: Center(
//               child: Column(
//                 children: [
//                   Icon(
//                     Icons.article_outlined,
//                     size: 48,
//                     color: theme.colorScheme.onSurface.withOpacity(0.5),
//                   ),
//                   const SizedBox(height: 16),
//                   Text(
//                     'No trending articles available',
//                     style: theme.textTheme.titleMedium?.copyWith(
//                       color: theme.colorScheme.onSurface.withOpacity(0.7),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Pull to refresh or try again later',
//                     style: theme.textTheme.bodyMedium?.copyWith(
//                       color: theme.colorScheme.onSurface.withOpacity(0.5),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//         else
//           SizedBox(
//             height: 250,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.symmetric(horizontal: 16),
//               itemCount: state.trendingArticles.length,
//               itemBuilder: (context, index) {
//                 final article = state.trendingArticles[index];
//                 return _buildTrendingArticleCard(article, theme, l10n);
//               },
//             ),
//           ),
//       ],
//     );
//   }

//   Widget _buildTrendingArticleCard(ArticleModel article, ThemeData theme, AppLocalizations l10n) {
//     return Padding(
//       padding: const EdgeInsets.only(right: 16),
//       child: InkWell(
//         onTap: () => _onTrendingItemTap(article),
//         borderRadius: BorderRadius.circular(16),
//         child: Container(
//           width: 280,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(16),
//             boxShadow: [
//               BoxShadow(
//                 color: theme.shadowColor.withOpacity(0.1),
//                 blurRadius: 8,
//                 offset: const Offset(0, 4),
//               ),
//             ],
//           ),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Article image
//               Expanded(
//                 flex: 3,
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                   child: Image.network(
//                     article.imageUrl ?? 'https://via.placeholder.com/280x150',
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                     errorBuilder: (context, error, stackTrace) {
//                       return Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: theme.colorScheme.primary.withOpacity(0.1),
//                           borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
//                         ),
//                         child: Icon(
//                           Icons.image_not_supported,
//                           color: theme.colorScheme.primary,
//                           size: 48,
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),

//               // Article content
//               Expanded(
//                 flex: 2,
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: theme.colorScheme.surface,
//                     borderRadius: const BorderRadius.vertical(bottom: Radius.circular(16)),
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Article title
//                       Expanded(
//                         child: Text(
//                           article.content.title,
//                           style: theme.textTheme.titleMedium?.copyWith(
//                             fontWeight: FontWeight.w700,
//                             height: 1.3,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),

//                       const SizedBox(height: 8),
//                       //
//                       // // Published time
//                       // if (article.publishedAt != null)
//                       //   Text(
//                       //     _getLocalizedTime(article.publishedAt!, l10n),
//                       //     style: theme.textTheme.bodySmall?.copyWith(
//                       //       color: theme.colorScheme.onSurface.withOpacity(0.6),
//                       //     ),
//                       //   ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildSearchSuggestions(ThemeData theme, AppLocalizations l10n) {
//     return BlocBuilder<CategoryBloc, CategoryState>(
//       builder: (context, categoryState) {
//         // Get categories from bloc state or fallback
//         List<String> categories;

//         if (categoryState is CategoryLoaded && categoryState.categoryResponse.results.isNotEmpty) {
//           categories = categoryState.categoryResponse.results.map((cat) => cat.name).toList();
//         } else {
//           // Use fallback categories with proper localization
//           categories = _getFallbackCategories(context);
//         }

//         return SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Category loading indicator
//               if (categoryState is CategoryLoading)
//                 const Center(
//                   child: Padding(
//                     padding: EdgeInsets.symmetric(vertical: 16),
//                     child: CircularProgressIndicator(),
//                   ),
//                 ),

//               // Categories section
//               Text(
//                 l10n.suggestedCategories,
//                 style: theme.textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Category chips
//               Wrap(
//                 spacing: 8,
//                 runSpacing: 8,
//                 children: categories.map((category) {
//                   return InkWell(
//                     onTap: () => _onCategoryTap(category),
//                     child: Chip(
//                       label: Text(
//                         category,
//                         style: TextStyle(
//                           color: theme.colorScheme.onPrimaryContainer,
//                         ),
//                       ),
//                       backgroundColor: theme.colorScheme.primaryContainer,
//                       side: BorderSide.none,
//                       padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
//                     ),
//                   );
//                 }).toList(),
//               ),

//               const SizedBox(height: 24),

//               Text(
//                 l10n.trendingSearches,
//                 style: theme.textTheme.titleMedium?.copyWith(
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(height: 16),

//               // Trending searches list
//               ...(_trendingSearches.map((search) {
//                 return ListTile(
//                   leading: Icon(
//                     Icons.trending_up,
//                     color: theme.colorScheme.primary,
//                   ),
//                   title: Text(
//                     search,
//                     style: theme.textTheme.bodyMedium,
//                   ),
//                   contentPadding: EdgeInsets.zero,
//                   dense: true,
//                   onTap: () => _onTrendingSearchTap(search),
//                 );
//               })),

//               // Category error handling
//               if (categoryState is CategoryError)
//                 Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 16),
//                   child: Container(
//                     padding: const EdgeInsets.all(12),
//                     decoration: BoxDecoration(
//                       color: theme.colorScheme.errorContainer.withOpacity(0.1),
//                       borderRadius: BorderRadius.circular(8),
//                       border: Border.all(
//                         color: theme.colorScheme.error.withOpacity(0.2),
//                       ),
//                     ),
//                     child: Row(
//                       children: [
//                         Icon(
//                           Icons.warning_amber_rounded,
//                           color: theme.colorScheme.error,
//                           size: 20,
//                         ),
//                         const SizedBox(width: 8),
//                         Expanded(
//                           child: Text(
//                             'Categories could not be loaded. Using defaults.',
//                             style: theme.textTheme.bodySmall?.copyWith(
//                               color: theme.colorScheme.error,
//                             ),
//                           ),
//                         ),
//                         TextButton(
//                           onPressed: () {
//                             context.read<CategoryBloc>().add(const FetchCategories(forceRefresh: true));
//                           },
//                           child: Text(
//                             'Retry',
//                             style: TextStyle(
//                               color: theme.colorScheme.error,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     );
//   }

//   Widget _buildSearchResults(ArticleState state, ThemeData theme, AppLocalizations l10n) {
//     if (state.status == ArticleStatus.loading) {
//       return const Center(
//         child: CircularProgressIndicator(),
//       );
//     }

//     if (state.status == ArticleStatus.failure) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: 64,
//               color: theme.colorScheme.error,
//             ),
//             const SizedBox(height: 16),
//             Text(
//               'Error loading search results',
//               style: theme.textTheme.titleMedium,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               state.error?.message ?? 'Unknown error occurred',
//               style: theme.textTheme.bodyMedium?.copyWith(
//                 color: theme.colorScheme.onSurface.withOpacity(0.7),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     if (state.searchResults.isEmpty) {
//       return Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.search_off,
//               size: 64,
//               color: theme.colorScheme.onSurface.withOpacity(0.5),
//             ),
//             const SizedBox(height: 16),
//             Text(
//               '${l10n.noResultsFound} "$_searchQuery"',
//               style: theme.textTheme.titleMedium,
//             ),
//             const SizedBox(height: 8),
//             Text(
//               l10n.tryDifferentKeywords,
//               style: theme.textTheme.bodyMedium?.copyWith(
//                 color: theme.colorScheme.onSurface.withOpacity(0.7),
//               ),
//             ),
//           ],
//         ),
//       );
//     }

//     return ListView.builder(
//       padding: const EdgeInsets.all(16),
//       itemCount: state.searchResults.length + (state.isSearchLoadingMore ? 1 : 0),
//       itemBuilder: (context, index) {
//         if (index == state.searchResults.length) {
//           // Loading indicator at the end
//           return const Center(
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: CircularProgressIndicator(),
//             ),
//           );
//         }

//         final article = state.searchResults[index];
//         return _buildSearchResultItem(article, theme, l10n);
//       },
//     );
//   }

//   Widget _buildSearchResultItem(ArticleModel article, ThemeData theme, AppLocalizations l10n) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: InkWell(
//         onTap: () => _onSearchItemTap(article),
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: theme.colorScheme.surface,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: theme.shadowColor.withOpacity(0.1),
//                 blurRadius: 4,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 7,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       article.content.title,
//                       style: theme.textTheme.titleSmall?.copyWith(
//                         fontWeight: FontWeight.w500,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 8),
//                     // Show summary from ArticleModel
//                     Text(
//                       article.content.summary,
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color: theme.colorScheme.onSurface.withOpacity(0.8),
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         if (article.categories.isNotEmpty) ...[
//                           Container(
//                             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                             decoration: BoxDecoration(
//                               color: theme.colorScheme.primaryContainer.withOpacity(0.3),
//                               borderRadius: BorderRadius.circular(4),
//                             ),
//                             child: Text(
//                               article.categories.first.name,
//                               style: theme.textTheme.bodySmall?.copyWith(
//                                 color: theme.colorScheme.primary,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                           const SizedBox(width: 8),
//                         ],
//                         if (article.content.sourceUrl != null) ...[
//                           Expanded(
//                             child: Text(
//                               article.content.sourceUrl!,
//                               style: theme.textTheme.bodySmall?.copyWith(
//                                 color: theme.colorScheme.onSurface.withOpacity(0.7),
//                               ),
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                           ),
//                         ],
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   article.imageUrl ?? 'https://via.placeholder.com/80x80',
//                   width: 80,
//                   height: 80,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: theme.colorScheme.primary.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Icon(
//                         Icons.image_not_supported,
//                         color: theme.colorScheme.primary,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildNotificationItem(Map<String, dynamic> item, ThemeData theme, AppLocalizations l10n) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16),
//       child: InkWell(
//         onTap: () {
//           // Navigate to article detail - for now just show a placeholder
//         },
//         borderRadius: BorderRadius.circular(12),
//         child: Container(
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: theme.colorScheme.surface,
//             borderRadius: BorderRadius.circular(12),
//             boxShadow: [
//               BoxShadow(
//                 color: theme.shadowColor.withOpacity(0.1),
//                 blurRadius: 4,
//                 offset: const Offset(0, 2),
//               ),
//             ],
//           ),
//           child: Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Expanded(
//                 flex: 7,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       item['title'] as String,
//                       style: theme.textTheme.titleSmall?.copyWith(
//                         fontWeight: FontWeight.w500,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 8),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//                           decoration: BoxDecoration(
//                             color: theme.colorScheme.primaryContainer.withOpacity(0.3),
//                             borderRadius: BorderRadius.circular(4),
//                           ),
//                           child: Text(
//                             _getLocalizedSource(item['source'] as String, l10n),
//                             style: theme.textTheme.bodySmall?.copyWith(
//                               color: theme.colorScheme.primary,
//                               fontWeight: FontWeight.w500,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Text(
//                           _getLocalizedTime(item['time'] as String, l10n),
//                           style: theme.textTheme.bodySmall?.copyWith(
//                             color: theme.colorScheme.onSurface.withOpacity(0.7),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(width: 16),
//               ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   item['imageUrl'] as String,
//                   width: 80,
//                   height: 80,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                         color: theme.colorScheme.primary.withOpacity(0.1),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Icon(
//                         Icons.image_not_supported,
//                         color: theme.colorScheme.primary,
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Helper method to localize source names
//   String _getLocalizedSource(String source, AppLocalizations l10n) {
//     switch (source.toLowerCase()) {
//       case 'world news':
//         return l10n.worldNews;
//       case 'business':
//         return l10n.business;
//       case 'politics':
//         return l10n.politics;
//       case 'entertainment':
//         return l10n.entertainment;
//       case 'sports':
//         return l10n.sports;
//       case 'technology':
//         return l10n.technology;
//       case 'health':
//         return l10n.health;
//       case 'science':
//         return l10n.science;
//       default:
//         return source;
//     }
//   }

//   // Helper method to localize time strings
//   String _getLocalizedTime(String time, AppLocalizations l10n) {
//     if (time.contains('hours ago')) {
//       final hours = time.split(' ')[0];
//       if (hours == '1') {
//         return '1 ${l10n.hourAgo}';
//       } else {
//         return '$hours ${l10n.hoursAgo}';
//       }
//     } else if (time.contains('day ago')) {
//       return '1 ${l10n.dayAgo}';
//     } else if (time.contains('days ago')) {
//       final days = time.split(' ')[0];
//       return '$days ${l10n.daysAgo}';
//     } else if (time.contains('minutes ago')) {
//       final minutes = time.split(' ')[0];
//       return '$minutes ${l10n.minutesAgo}';
//     }
//     return time;
//   }
// }










// // // screens/search_screen.dart
// // import 'package:auto_route/auto_route.dart';
// // import 'package:flutter/material.dart';
// // import '../../../../config/router/app_router.dart';
// // import '../../../../domain/models/news/news_headline_model.dart';
// // import '../../../../presentation/_widget/bottom_nav_bar.dart';
// // import '../../../../presentation/_widget/search_page_widgets/headline_section_widget.dart';
// // import 'package:flutter_gen/gen_l10n/app_localizations.dart';
// //
// // @RoutePage()
// // class SearchScreen extends StatefulWidget {
// //   const SearchScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   State<SearchScreen> createState() => _SearchScreenState();
// // }
// //
// // class _SearchScreenState extends State<SearchScreen> {
// //   final TextEditingController _searchController = TextEditingController();
// //   bool _isSearching = false;
// //   String _searchQuery = '';
// //
// //   // Sample trending searches
// //   final List<String> _trendingSearches = [
// //     'Climate change', 'Stock market', 'COVID-19 updates',
// //     'Cryptocurrency', 'Olympics', 'Election results'
// //   ];
// //
// //   // Sample search results - in a real app this would come from an API
// //   final List<Map<String, dynamic>> _searchResults = [
// //     {
// //       'title': 'Trump imposes tariffs on Antarctic islands where only penguin & seals live',
// //       'source': 'World News',
// //       'time': '2 hours ago',
// //       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M5T8Q6waMeTcge0cMzk3MDE=/nepali-cricket-supporters-fans-shield-themselves-umbrella-1500w-13893790i.jpg',
// //     },
// //     {
// //       'title': 'China urges US to immediately cancel tariffs, vows retaliation',
// //       'source': 'Business',
// //       'time': '4 hours ago',
// //       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M5T8Q6waMeTcge0cMzk3MDE=/nepali-cricket-supporters-fans-shield-themselves-umbrella-1500w-13893790i.jpg',
// //     },
// //     {
// //       'title': 'Waqf Bill brought in Rajya Sabha after Lok Sabha passes it',
// //       'source': 'Politics',
// //       'time': '1 day ago',
// //       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M5T8Q6waMeTcge0cMzk3MDE=/nepali-cricket-supporters-fans-shield-themselves-umbrella-1500w-13893790i.jpg',
// //     },
// //     {
// //       'title': 'When Manoj Kumar sued SRK for \'disrespecting\' him, sought ₹100 cr',
// //       'source': 'Entertainment',
// //       'time': '2 days ago',
// //       'imageUrl': 'https://www.shutterstock.com/editorial/image-editorial/M8T0Qbw5MfT6gf0bMzk3MDU=/nepali-cricket-players-along-last-remaining-uae-1500w-13893790k.jpg',
// //     },
// //   ];
// //
// //   // Get headlines data for horizontal scrolling sections
// //   final List<NewsHeadline> _topHeadlines = NewsHeadline.getSampleHeadlines();
// //
// //   @override
// //   void dispose() {
// //     _searchController.dispose();
// //     super.dispose();
// //   }
// //
// //   void _startSearch() {
// //     setState(() {
// //       _isSearching = true;
// //     });
// //   }
// //
// //   void _stopSearch() {
// //     setState(() {
// //       _isSearching = false;
// //       _searchQuery = '';
// //       _searchController.clear();
// //     });
// //   }
// //
// //   void _onSearchQueryChanged(String query) {
// //     setState(() {
// //       _searchQuery = query;
// //     });
// //   }
// //
// //   // Handler for left swipe navigation
// //   void _handleLeftSwipe() {
// //     context.router.push(NewsRoute());
// //   }
// //
// //   // Helper method to get categories with proper localization
// //   List<String> _getCategories(BuildContext context) {
// //     final l10n = AppLocalizations.of(context)!;
// //     return [
// //       l10n.politics,
// //       l10n.business,
// //       l10n.technology,
// //       l10n.health,
// //       l10n.science,
// //       l10n.sports,
// //       l10n.entertainment,
// //       l10n.world
// //     ];
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final theme = Theme.of(context);
// //     final l10n = AppLocalizations.of(context)!;
// //
// //     return GestureDetector(
// //       // Detect horizontal swipes
// //       onHorizontalDragEnd: (details) {
// //         // Detect left swipe
// //         if (details.primaryVelocity != null && details.primaryVelocity! < 0) {
// //           _handleLeftSwipe();
// //         }
// //       },
// //       child: Scaffold(
// //         backgroundColor: theme.colorScheme.background,
// //         body: SafeArea(
// //           child: Column(
// //             children: [
// //               // Search bar
// //               Padding(
// //                 padding: const EdgeInsets.all(16.0),
// //                 child: TextField(
// //                   controller: _searchController,
// //                   decoration: InputDecoration(
// //                     hintText: l10n.searchForNews,
// //                     hintStyle: theme.textTheme.bodyMedium?.copyWith(
// //                       color: theme.colorScheme.onSurface.withOpacity(0.6),
// //                     ),
// //                     prefixIcon: Icon(
// //                       Icons.search,
// //                       color: theme.colorScheme.primary,
// //                     ),
// //                     suffixIcon: _isSearching
// //                         ? IconButton(
// //                       icon: Icon(
// //                         Icons.clear,
// //                         color: theme.colorScheme.primary,
// //                       ),
// //                       onPressed: _stopSearch,
// //                     )
// //                         : null,
// //                     border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(12.0),
// //                       borderSide: BorderSide.none,
// //                     ),
// //                     filled: true,
// //                     fillColor: theme.colorScheme.surfaceVariant.withOpacity(0.3),
// //                   ),
// //                   onChanged: _onSearchQueryChanged,
// //                   onTap: _startSearch,
// //                   style: theme.textTheme.bodyMedium,
// //                 ),
// //               ),
// //
// //               // Promotional banner
// //               if (!_isSearching) _buildPromoBanner(theme, l10n),
// //
// //               // Content based on search state
// //               Expanded(
// //                 child: _isSearching && _searchQuery.isNotEmpty
// //                     ? _buildSearchResults(theme, l10n)
// //                     : _isSearching
// //                     ? _buildSearchSuggestions(theme, l10n)
// //                     : _buildContentWithHeadlines(theme, l10n),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildPromoBanner(ThemeData theme, AppLocalizations l10n) {
// //     return Padding(
// //       padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
// //       child: Container(
// //         height: 120,
// //         decoration: BoxDecoration(
// //           borderRadius: BorderRadius.circular(16),
// //           gradient: LinearGradient(
// //             begin: Alignment.topLeft,
// //             end: Alignment.bottomRight,
// //             colors: [
// //               theme.colorScheme.primaryContainer,
// //               theme.colorScheme.secondaryContainer,
// //             ],
// //           ),
// //         ),
// //         child: Row(
// //           children: [
// //             const SizedBox(width: 20),
// //             Expanded(
// //               flex: 2,
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 mainAxisAlignment: MainAxisAlignment.center,
// //                 children: [
// //                   Text(
// //                     l10n.newsInNepal,
// //                     style: theme.textTheme.titleLarge?.copyWith(
// //                       fontWeight: FontWeight.bold,
// //                       color: theme.colorScheme.onPrimaryContainer,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   Container(
// //                     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //                     decoration: BoxDecoration(
// //                       color: theme.colorScheme.tertiary.withOpacity(0.2),
// //                       borderRadius: BorderRadius.circular(16),
// //                     ),
// //                     child: Text(
// //                       l10n.latestUpdates,
// //                       style: theme.textTheme.labelSmall?.copyWith(
// //                         color: theme.colorScheme.onSecondaryContainer,
// //                         fontWeight: FontWeight.bold,
// //                       ),
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //             Expanded(
// //               flex: 1,
// //               child: Container(),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildContentWithHeadlines(ThemeData theme, AppLocalizations l10n) {
// //     return SingleChildScrollView(
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Top Headlines section
// //           HeadlinesSection(
// //             sectionTitle: l10n.topHeadlines,
// //             headlines: _topHeadlines,
// //           ),
// //
// //           const SizedBox(height: 16),
// //
// //           // Notifications section
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   l10n.notifications,
// //                   style: theme.textTheme.titleLarge?.copyWith(
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //                 Text(
// //                   l10n.viewAll,
// //                   style: theme.textTheme.labelMedium?.copyWith(
// //                     color: theme.colorScheme.primary,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //
// //           // Notification items
// //           ..._searchResults.map((result) => _buildNewsItem(result, theme, l10n)),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildNavItem(IconData icon, String label, ThemeData theme) {
// //     Color iconColor = theme.colorScheme.primary;
// //
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.center,
// //       children: [
// //         Icon(
// //           icon,
// //           color: iconColor,
// //           size: 28,
// //         ),
// //         const SizedBox(height: 8),
// //         Text(
// //           label,
// //           style: theme.textTheme.bodyMedium?.copyWith(
// //             fontWeight: FontWeight.w500,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildSearchSuggestions(ThemeData theme, AppLocalizations l10n) {
// //     // Get categories with proper localization
// //     final categories = _getCategories(context);
// //
// //     return SingleChildScrollView(
// //       padding: const EdgeInsets.all(16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             l10n.suggestedCategories,
// //             style: theme.textTheme.titleMedium?.copyWith(
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           const SizedBox(height: 16),
// //
// //           // Category chips
// //           Wrap(
// //             spacing: 8,
// //             runSpacing: 8,
// //             children: categories.map((category) {
// //               return Chip(
// //                 label: Text(
// //                   category,
// //                   style: TextStyle(
// //                     color: theme.colorScheme.onPrimaryContainer,
// //                   ),
// //                 ),
// //                 backgroundColor: theme.colorScheme.primaryContainer,
// //                 side: BorderSide.none,
// //                 padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 0),
// //               );
// //             }).toList(),
// //           ),
// //
// //           const SizedBox(height: 24),
// //
// //           Text(
// //             l10n.trendingSearches,
// //             style: theme.textTheme.titleMedium?.copyWith(
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           const SizedBox(height: 16),
// //
// //           // Trending searches list
// //           ...(_trendingSearches.map((search) {
// //             return ListTile(
// //               leading: Icon(
// //                 Icons.trending_up,
// //                 color: theme.colorScheme.primary,
// //               ),
// //               title: Text(
// //                 search,
// //                 style: theme.textTheme.bodyMedium,
// //               ),
// //               contentPadding: EdgeInsets.zero,
// //               dense: true,
// //               onTap: () {
// //                 _searchController.text = search;
// //                 _onSearchQueryChanged(search);
// //               },
// //             );
// //           })),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildSearchResults(ThemeData theme, AppLocalizations l10n) {
// //     final filteredResults = _searchResults.where(
// //             (result) => result['title'].toString().toLowerCase().contains(_searchQuery.toLowerCase())
// //     ).toList();
// //
// //     if (filteredResults.isEmpty) {
// //       return Center(
// //         child: Column(
// //           mainAxisAlignment: MainAxisAlignment.center,
// //           children: [
// //             Icon(
// //               Icons.search_off,
// //               size: 64,
// //               color: theme.colorScheme.onSurface.withOpacity(0.5),
// //             ),
// //             const SizedBox(height: 16),
// //             Text(
// //               '${l10n.noResultsFound} "$_searchQuery"',
// //               style: theme.textTheme.titleMedium,
// //             ),
// //             const SizedBox(height: 8),
// //             Text(
// //               l10n.tryDifferentKeywords,
// //               style: theme.textTheme.bodyMedium?.copyWith(
// //                 color: theme.colorScheme.onSurface.withOpacity(0.7),
// //               ),
// //             ),
// //           ],
// //         ),
// //       );
// //     }
// //
// //     return ListView.builder(
// //       padding: const EdgeInsets.all(16),
// //       itemCount: filteredResults.length,
// //       itemBuilder: (context, index) {
// //         return _buildNewsItem(filteredResults[index], theme, l10n);
// //       },
// //     );
// //   }
// //
// //   Widget _buildNewsItem(Map<String, dynamic> item, ThemeData theme, AppLocalizations l10n) {
// //     return Padding(
// //       padding: const EdgeInsets.only(bottom: 16),
// //       child: InkWell(
// //         onTap: () {
// //           // Navigate to article detail
// //         },
// //         borderRadius: BorderRadius.circular(12),
// //         child: Container(
// //           padding: const EdgeInsets.all(12),
// //           decoration: BoxDecoration(
// //             color: theme.colorScheme.surface,
// //             borderRadius: BorderRadius.circular(12),
// //             boxShadow: [
// //               BoxShadow(
// //                 color: theme.shadowColor.withOpacity(0.1),
// //                 blurRadius: 4,
// //                 offset: const Offset(0, 2),
// //               ),
// //             ],
// //           ),
// //           child: Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Expanded(
// //                 flex: 7,
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       item['title'] as String,
// //                       style: theme.textTheme.titleSmall?.copyWith(
// //                         fontWeight: FontWeight.w500,
// //                       ),
// //                       maxLines: 2,
// //                       overflow: TextOverflow.ellipsis,
// //                     ),
// //                     const SizedBox(height: 8),
// //                     Row(
// //                       children: [
// //                         Container(
// //                           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
// //                           decoration: BoxDecoration(
// //                             color: theme.colorScheme.primaryContainer.withOpacity(0.3),
// //                             borderRadius: BorderRadius.circular(4),
// //                           ),
// //                           child: Text(
// //                             _getLocalizedSource(item['source'] as String, l10n),
// //                             style: theme.textTheme.bodySmall?.copyWith(
// //                               color: theme.colorScheme.primary,
// //                               fontWeight: FontWeight.w500,
// //                             ),
// //                           ),
// //                         ),
// //                         const SizedBox(width: 8),
// //                         Text(
// //                           _getLocalizedTime(item['time'] as String, l10n),
// //                           style: theme.textTheme.bodySmall?.copyWith(
// //                             color: theme.colorScheme.onSurface.withOpacity(0.7),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //               const SizedBox(width: 16),
// //               ClipRRect(
// //                 borderRadius: BorderRadius.circular(8),
// //                 child: Image.network(
// //                   item['imageUrl'] as String,
// //                   width: 80,
// //                   height: 80,
// //                   fit: BoxFit.cover,
// //                   errorBuilder: (context, error, stackTrace) {
// //                     return Container(
// //                       width: 80,
// //                       height: 80,
// //                       decoration: BoxDecoration(
// //                         color: theme.colorScheme.primary.withOpacity(0.1),
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                       child: Icon(
// //                         Icons.image_not_supported,
// //                         color: theme.colorScheme.primary,
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Helper method to localize source names
// //   String _getLocalizedSource(String source, AppLocalizations l10n) {
// //     switch (source.toLowerCase()) {
// //       case 'world news':
// //         return l10n.worldNews;
// //       case 'business':
// //         return l10n.business;
// //       case 'politics':
// //         return l10n.politics;
// //       case 'entertainment':
// //         return l10n.entertainment;
// //       case 'sports':
// //         return l10n.sports;
// //       case 'technology':
// //         return l10n.technology;
// //       case 'health':
// //         return l10n.health;
// //       case 'science':
// //         return l10n.science;
// //       default:
// //         return source;
// //     }
// //   }
// //
// //   // Helper method to localize time strings
// //   String _getLocalizedTime(String time, AppLocalizations l10n) {
// //     if (time.contains('hours ago')) {
// //       final hours = time.split(' ')[0];
// //       if (hours == '1') {
// //         return '1 ${l10n.hourAgo}';
// //       } else {
// //         return '$hours ${l10n.hoursAgo}';
// //       }
// //     } else if (time.contains('day ago')) {
// //       return '1 ${l10n.dayAgo}';
// //     } else if (time.contains('days ago')) {
// //       final days = time.split(' ')[0];
// //       return '$days ${l10n.daysAgo}';
// //     } else if (time.contains('minutes ago')) {
// //       final minutes = time.split(' ')[0];
// //       return '$minutes ${l10n.minutesAgo}';
// //     }
// //     return time;
// //   }
// // }