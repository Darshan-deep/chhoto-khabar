// // screens/bookmarks_screen.dart
// import 'package:auto_route/auto_route.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// // Import your bloc and models
// import '../../../../config/router/app_router.dart';
// import '../../../news/data/models/article_model.dart';
// import '../../../news/presentation/blocs/article_bloc/article_bloc.dart';
// import '../../../news/presentation/blocs/article_bloc/article_event.dart';
// import '../../../news/presentation/blocs/article_bloc/article_state.dart';

// @RoutePage()
// class BookmarksScreen extends StatefulWidget {
//   const BookmarksScreen({Key? key}) : super(key: key);

//   @override
//   State<BookmarksScreen> createState() => _BookmarksScreenState();
// }

// class _BookmarksScreenState extends State<BookmarksScreen> {
//   late ScrollController _scrollController;

//   @override
//   void initState() {
//     super.initState();
//     _scrollController = ScrollController();
//     _scrollController.addListener(_onScroll);

//     // Fetch bookmarks when screen loads
//     context.read<ArticleBloc>().add(const FetchBookmarks());
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     super.dispose();
//   }

//   void _onScroll() {
//     if (_isBottom) {
//       final articleBloc = context.read<ArticleBloc>();
//       if (articleBloc.canLoadMore()) {
//         articleBloc.loadMore();
//       }
//     }
//   }

//   bool get _isBottom {
//     if (!_scrollController.hasClients) return false;
//     final maxScroll = _scrollController.position.maxScrollExtent;
//     final currentScroll = _scrollController.offset;
//     return currentScroll >= (maxScroll * 0.9);
//   }

//   // Method to handle article tap with proper article passing
//   void _onArticleTap(ArticleModel article) {
//     context.router.push(
//       NewsRoute(
//         initialArticle: article,
//         viewMode: ArticleViewMode.bookmarks,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final theme = Theme.of(context);
//     final l10n = AppLocalizations.of(context)!;

//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           l10n.myBookmarks,
//           style: theme.textTheme.titleLarge?.copyWith(
//             color: theme.appBarTheme.foregroundColor,
//           ),
//         ),
//         backgroundColor: theme.appBarTheme.backgroundColor,
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: theme.appBarTheme.foregroundColor,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       backgroundColor: theme.colorScheme.background,
//       body: BlocConsumer<ArticleBloc, ArticleState>(
//         listener: (context, state) {
//           if (state.status == ArticleStatus.failure && state.error != null) {
//             ScaffoldMessenger.of(context).showSnackBar(
//               SnackBar(
//                 content: Text(state.error!.message),
//                 backgroundColor: theme.colorScheme.error,
//               ),
//             );
//           }
//         },
//         builder: (context, state) {
//           if (state.status == ArticleStatus.loading && state.bookmarkedArticles.isEmpty) {
//             return _buildLoadingState(theme);
//           }

//           if (!state.isAuthenticated) {
//             return _buildUnauthenticatedState(theme, l10n);
//           }

//           if (state.bookmarkedArticles.isEmpty && state.status != ArticleStatus.loading) {
//             return _buildEmptyState(theme, l10n);
//           }

//           return _buildBookmarksList(state, theme, context);
//         },
//       ),
//     );
//   }

//   Widget _buildLoadingState(ThemeData theme) {
//     return const Center(
//       child: CircularProgressIndicator(),
//     );
//   }

//   Widget _buildUnauthenticatedState(ThemeData theme, AppLocalizations l10n) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.login,
//             size: 80,
//             color: theme.colorScheme.primary.withOpacity(0.7),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'Please sign in to view bookmarks',
//             style: theme.textTheme.headlineSmall,
//             textAlign: TextAlign.center,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Sign in to access your saved articles',
//             style: theme.textTheme.bodyLarge?.copyWith(
//               color: theme.colorScheme.onSurface.withOpacity(0.7),
//             ),
//             textAlign: TextAlign.center,
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildEmptyState(ThemeData theme, AppLocalizations l10n) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.bookmark_border,
//             size: 80,
//             color: theme.colorScheme.primary.withOpacity(0.7),
//           ),
//           const SizedBox(height: 16),
//           Text(
//             'No bookmarks yet',
//             style: theme.textTheme.headlineSmall,
//           ),
//           const SizedBox(height: 8),
//           Text(
//             'Articles you bookmark will appear here',
//             style: theme.textTheme.bodyLarge?.copyWith(
//               color: theme.colorScheme.onSurface.withOpacity(0.7),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBookmarksList(ArticleState state, ThemeData theme, BuildContext context) {
//     return RefreshIndicator(
//       onRefresh: () async {
//         context.read<ArticleBloc>().add(const FetchBookmarks(isRefresh: true));
//       },
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           if (state.status == ArticleStatus.refreshing)
//             const LinearProgressIndicator(),
//           Padding(
//             padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
//             child: Text(
//               DateFormat('MM/dd/yyyy HH:mm').format(DateTime.now()),
//               style: theme.textTheme.bodySmall?.copyWith(
//                 color: theme.colorScheme.onSurface.withOpacity(0.6),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.separated(
//               controller: _scrollController,
//               padding: const EdgeInsets.all(16),
//               itemCount: state.bookmarkedArticles.length +
//                   (state.isBookmarksLoadingMore ? 1 : 0),
//               separatorBuilder: (context, index) => const SizedBox(height: 16),
//               itemBuilder: (context, index) {
//                 if (index >= state.bookmarkedArticles.length) {
//                   return const Center(
//                     child: Padding(
//                       padding: EdgeInsets.all(16),
//                       child: CircularProgressIndicator(),
//                     ),
//                   );
//                 }

//                 final article = state.bookmarkedArticles[index];
//                 return _buildBookmarkItem(article, theme);
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildBookmarkItem(ArticleModel article, ThemeData theme) {
//     return InkWell(
//       onTap: () => _onArticleTap(article), // Use the dedicated method
//       borderRadius: BorderRadius.circular(8),
//       child: Container(
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(8),
//           border: Border.all(
//             color: theme.colorScheme.onSurface.withOpacity(0.1),
//           ),
//         ),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               flex: 7,
//               child: Padding(
//                 padding: const EdgeInsets.all(12),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       article.content.title,
//                       style: theme.textTheme.titleMedium,
//                       maxLines: 3,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 8),
//                     Text(
//                       _formatDate(article.createdAt),
//                       style: theme.textTheme.bodySmall?.copyWith(
//                         color: theme.colorScheme.onSurface.withOpacity(0.6),
//                       ),
//                     ),
//                     if (article.categories.isNotEmpty && article.categories.first != null) ...[
//                       const SizedBox(height: 4),
//                       Container(
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                         decoration: BoxDecoration(
//                           color: theme.colorScheme.primary.withOpacity(0.1),
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Text(
//                           article.categories.first.name,
//                           style: theme.textTheme.bodySmall?.copyWith(
//                             color: theme.colorScheme.primary,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ],
//                 ),
//               ),
//             ),
//             if (article.imageUrl != null)
//               Expanded(
//                 flex: 3,
//                 child: ClipRRect(
//                   borderRadius: const BorderRadius.only(
//                     topRight: Radius.circular(8),
//                     bottomRight: Radius.circular(8),
//                   ),
//                   child: AspectRatio(
//                     aspectRatio: 1,
//                     child: Image.network(
//                       article.imageUrl!,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           color: theme.colorScheme.primary.withOpacity(0.1),
//                           child: Icon(
//                             Icons.image_not_supported,
//                             color: theme.colorScheme.primary,
//                           ),
//                         );
//                       },
//                       loadingBuilder: (context, child, loadingProgress) {
//                         if (loadingProgress == null) return child;
//                         return Container(
//                           color: theme.colorScheme.primary.withOpacity(0.1),
//                           child: const Center(
//                             child: CircularProgressIndicator(),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }

//   String _formatDate(DateTime date) {
//     final now = DateTime.now();
//     final difference = now.difference(date);

//     if (difference.inDays > 0) {
//       return DateFormat('MM/dd/yyyy').format(date);
//     } else if (difference.inHours > 0) {
//       return '${difference.inHours}h ago';
//     } else if (difference.inMinutes > 0) {
//       return '${difference.inMinutes}m ago';
//     } else {
//       return 'Just now';
//     }
//   }
// }