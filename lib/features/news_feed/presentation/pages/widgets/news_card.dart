import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsCard extends StatelessWidget {
  final ArticleModel article;
  final VoidCallback onLike;
  final VoidCallback onComment;
  final VoidCallback onShare;
  final VoidCallback onBookmark;
  final String Function(int) formatNumber;
  final int currentIndex;
  final int totalItems;
  final bool isLongContent;
  final String? language;

  const NewsCard({
    Key? key,
    required this.article,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onBookmark,
    required this.formatNumber,
    required this.currentIndex,
    required this.totalItems,
    required this.isLongContent,
    this.language,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentLanguage = language ?? 'en';

    return Container(
      height: MediaQuery.of(context).size.height,
      color: const Color(0xFFE5F2F3),
      child: Stack(
        children: [
          // Main content
          Column(
            children: [
              // Image Section (Top Half)
              Expanded(
                flex: 2,
                child: Container(
                  width: double.infinity,
                  child: Stack(
                    children: [
                      _buildImageWithFallback(),
                      // Gradient overlay for better readability
                      Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withOpacity(0.1),
                              Colors.black.withOpacity(0.3),
                            ],
                            stops: const [0.0, 1.0],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              // Content Section (Bottom Half)
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Category badge
                      Container(
                        padding:
                            const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          article.categories.isNotEmpty
                              ? (article.categories.first.name['en'] ?? 'News')
                                  .toUpperCase()
                              : 'BUSINESS',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Title
                      Text(
                        article.content.title[currentLanguage] ??
                            article.content.title['en'] ??
                            'No title',
                        style: GoogleFonts.poppins(
                          color: Colors.black87,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          height: 1.3,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 12),

                      // Summary
                      if (article.content.summary[currentLanguage] != null &&
                          article.content.summary[currentLanguage]!.isNotEmpty)
                        Expanded(
                          child: Text(
                            article.content.summary[currentLanguage] ?? '',
                            style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 14,
                              height: 1.4,
                            ),
                            maxLines: 6,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),


                      // Author and date
                      Row(
                        children: [
                          if (article.author != null)
                            Text(
                              article.author!.fullName,
                              style: GoogleFonts.poppins(
                                color: Colors.black54,
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          if (article.author != null) const SizedBox(width: 8),
                          Text(
                            '• ${_getTimeAgo(article.publishedAt)}',
                            style: GoogleFonts.poppins(
                              color: Colors.black54,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          
          // Floating action buttons positioned relative to entire page
          Positioned(
            right: 16,
            top: 0,
            bottom: 0,
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildFloatingActionButton(
                    iconAsset: article.isLiked
                        ? 'assets/icons/like_active.png'
                        : 'assets/icons/like.png',
                    count: formatNumber(article.numberOfLikes),
                    color: article.isLiked ? Colors.red : Colors.white,
                    onTap: onLike,
                  ),
                  const SizedBox(height: 12),
                  _buildFloatingActionButton(
                    iconAsset: 'assets/icons/chat_bubble.png',
                    count: formatNumber(article.numberOfComments),
                    color: Colors.white,
                    onTap: onComment,
                  ),
                  const SizedBox(height: 12),
                  _buildFloatingActionButton(
                    iconAsset: article.isBookmarked
                        ? 'assets/icons/bookmark_active.png'
                        : 'assets/icons/bookmark.png',
                    count: '',
                    color: article.isBookmarked
                        ? Colors.amber
                        : Colors.white,
                    onTap: onBookmark,
                  ),
                  const SizedBox(height: 12),
                  _buildFloatingActionButton(
                    iconAsset: 'assets/icons/share.png',
                    count: '',
                    color: Colors.white,
                    onTap: onShare,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithFallback() {
    return ClipRRect(
      // Remove bottom left and right radius
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
        bottomLeft: Radius.zero,
        bottomRight: Radius.zero,
      ),
      child: article.imageUrl != null && article.imageUrl!.isNotEmpty
          ? Image.network(
              article.imageUrl!,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
                  _buildFallbackImage(),
            )
          : _buildFallbackImage(),
    );
  }

  Widget _buildFallbackImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: _getCategoryColor(),
        // Remove bottom left and right radius for fallback image too
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
          bottomLeft: Radius.zero,
          bottomRight: Radius.zero,
        ),
      ),
      child: const Icon(
        Icons.article,
        color: Colors.white,
        size: 80,
      ),
    );
  }

  Widget _buildFloatingActionButton({
    required String iconAsset,
    required String count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Image.asset(
                iconAsset,
                width: 25,
                height: 25,
                color: color,
                errorBuilder: (context, error, stackTrace) => Icon(
                  Icons.favorite,
                  color: color,
                  size: 24,
                ),
              ),
            ),
          ),
          if (count.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              count,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }

  Color _getCategoryColor() {
    if (article.categories.isNotEmpty) {
      final colorCode = article.categories.first.colorCode;
      if (colorCode.isNotEmpty) {
        try {
          return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
        } catch (e) {
          return Colors.teal;
        }
      }
    }
    return Colors.teal;
  }

  String _getTimeAgo(String publishedDateString) {
    try {
      final publishedDate = DateTime.parse(publishedDateString);
      final now = DateTime.now();
      final difference = now.difference(publishedDate);

      if (difference.inDays > 0) {
        return '${difference.inDays}d ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m ago';
      } else {
        return 'just now';
      }
    } catch (e) {
      return publishedDateString; // Return original string if parsing fails
    }
  }
}