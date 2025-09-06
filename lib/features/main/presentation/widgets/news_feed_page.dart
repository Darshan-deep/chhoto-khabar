import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/bloc/news_bloc.dart';
import 'package:chhoto_khabar/features/news_feed/presentation/pages/widgets/news_card.dart';
import 'package:chhoto_khabar/shared/language/presentation/language_bloc/language_bloc.dart';
import 'package:chhoto_khabar/shared/language/utils/language_helper.dart';
import 'package:chhoto_khabar/core/widgets/news_shimmer_effects.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsFeedPage extends StatelessWidget {
  final PageController newsFeedPageController;
  final PageController mainPageController;
  final int currentNewsIndex;
  final Function(int) onPageChanged;
  final Function(String) onLike;
  final Function(String) onBookmark;
  final Function(ArticleModel) onShare;
  final Function(ArticleModel) onComment;
  final String Function(int) formatNumber;
  final int Function(String) countWords;

  const NewsFeedPage({
    super.key,
    required this.newsFeedPageController,
    required this.mainPageController,
    required this.currentNewsIndex,
    required this.onPageChanged,
    required this.onLike,
    required this.onBookmark,
    required this.onShare,
    required this.onComment,
    required this.formatNumber,
    required this.countWords,
  });

  Future<void> _openFullArticle(BuildContext context, String? sourceUrl) async {
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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        return state.when(
          initial: () => NewsShimmerEffects.buildList(
            itemCount: 3,
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
          loading: () => NewsShimmerEffects.buildList(
            itemCount: 3,
            padding: const EdgeInsets.symmetric(vertical: 20),
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
              controller: newsFeedPageController,
              scrollDirection: Axis.vertical,
              onPageChanged: (index) {
                onPageChanged(index);
                
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
                      mainPageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                    // Left swipe - launch URL
                    else if (details.primaryVelocity! < -500) {
                      HapticFeedback.mediumImpact();
                      _openFullArticle(context, article.content.sourceUrl);
                    }
                  },
                  child: BlocBuilder<LanguageBloc, LanguageState>(
                    builder: (context, languageState) {
                      final currentLanguageCode =
                          LanguageHelper.getApiLanguageCode(
                              languageState.selectedLanguage);
                      return NewsCard(
                        article: article,
                        onLike: () => onLike(article.id),
                        onComment: () => onComment(article),
                        onShare: () => onShare(article),
                        onBookmark: () => onBookmark(article.id),
                        formatNumber: formatNumber,
                        currentIndex: currentNewsIndex,
                        totalItems: articles.length,
                        language: currentLanguageCode,
                        isLongContent: countWords(article.content
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
                const Text(
                  'Error loading news',
                  style: TextStyle(
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
                    context.read<NewsBloc>().add(const NewsEvent.refreshNews());
                  },
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
          actionLoading: () => NewsShimmerEffects.buildList(
            itemCount: 2,
            padding: const EdgeInsets.symmetric(vertical: 20),
          ),
        );
      },
    );
  }
}
