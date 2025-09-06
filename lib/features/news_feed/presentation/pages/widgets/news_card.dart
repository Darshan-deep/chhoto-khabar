

import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:flutter/material.dart';

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
  final String? language; // Add language parameter

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
    this.language, // Optional language parameter, defaults to 'en'
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String currentLanguage = language ?? 'en'; // Default to English
    
    return Container(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                _buildImageWithFallback(),
                // Gradient overlay for better text readability
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withOpacity(0.1),
                        Colors.black.withOpacity(0.3),
                        Colors.black.withOpacity(0.7),
                      ],
                      stops: [0.0, 0.6, 1.0],
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Content overlay
          Positioned(
            left: 16,
            right: 80,
            bottom: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getCategoryColor(),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    article.categories.isNotEmpty 
                        ? (article.categories.first.name['en'] ?? 'News').toUpperCase()
                        : 'BUSINESS',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                
                // Title
                Text(
                  article.content.title[currentLanguage] ?? article.content.title['en'] ?? 'No title',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                    letterSpacing: -0.5,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                
                // Description
                Text(
                  article.content.summary[currentLanguage] ?? 
                  article.content.content[currentLanguage] ?? 
                  article.content.summary['en'] ?? 
                  article.content.content['en'] ?? 
                  'No content',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    height: 1.4,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                
                // Author and time
                Row(
                  children: [
                    // Author avatar placeholder
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: _getCategoryColor(),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 16,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      article.author?.fullName ?? 'Chhoto Khabar',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '• ${_getTimeAgo(article.publishedAt)}',
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Right side actions (TikTok style)
          Positioned(
            right: 16,
            bottom: 100,
            child: Column(
              children: [
                _buildFloatingActionButton(
                  icon: article.isLiked ? Icons.favorite : Icons.favorite_border,
                  count: formatNumber(article.numberOfLikes),
                  color: article.isLiked ? Colors.red : Colors.white,
                  onTap: onLike,
                ),
                const SizedBox(height: 20),
                _buildFloatingActionButton(
                  icon: Icons.chat_bubble_outline,
                  count: formatNumber(article.numberOfComments),
                  color: Colors.white,
                  onTap: onComment,
                ),
                const SizedBox(height: 20),
                _buildFloatingActionButton(
                  icon: article.isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  count: '',
                  color: article.isBookmarked ? Colors.amber : Colors.white,
                  onTap: onBookmark,
                ),
                const SizedBox(height: 20),
                _buildFloatingActionButton(
                  icon: Icons.share,
                  count: '',
                  color: Colors.white,
                  onTap: onShare,
                ),
              ],
            ),
          ),
          
          // Swipe hints
          Positioned(
            bottom: 40,
            left: 16,
            right: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left swipe hint
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.swipe_left, color: Colors.white, size: 14),
                      SizedBox(width: 4),
                      Text(
                        'Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
                // Right swipe hint
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Read',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                        ),
                      ),
                      SizedBox(width: 4),
                      Icon(Icons.swipe_right, color: Colors.white, size: 14),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageWithFallback() {
    if (article.imageUrl != null && article.imageUrl!.isNotEmpty) {
      return Image.network(
        article.imageUrl!,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        errorBuilder: (context, error, stackTrace) {
          return _buildFallbackImage();
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey[200],
            child: Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
                color: _getCategoryColor(),
              ),
            ),
          );
        },
      );
    } else {
      return _buildFallbackImage();
    }
  }

  Widget _buildFallbackImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: _getCategoryColor().withOpacity(0.2),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            _getCategoryIcon(),
            size: 80,
            color: _getCategoryColor(),
          ),
          const SizedBox(height: 16),
          Text(
            article.categories.isNotEmpty 
                ? (article.categories.first.name['en'] ?? 'News')
                : 'News',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: _getCategoryColor(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingActionButton({
    required IconData icon,
    required String count,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 28),
          ),
          if (count.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              count,
              style: const TextStyle(
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
      try {
        return Color(int.parse(colorCode.replaceFirst('#', '0xFF')));
      } catch (e) {
        return Colors.blue;
      }
    }
    return Colors.blue;
  }

  IconData _getCategoryIcon() {
    if (article.categories.isNotEmpty) {
      final categoryName = article.categories.first.name['en']?.toLowerCase() ?? '';
      switch (categoryName) {
        case 'business':
          return Icons.business;
        case 'sport':
          return Icons.sports;
        case 'politics':
          return Icons.account_balance;
        case 'economy':
          return Icons.trending_up;
        default:
          return Icons.article;
      }
    }
    return Icons.article;
  }

  String _getTimeAgo(String publishedAt) {
    try {
      final dateTime = DateTime.parse(publishedAt);
      final now = DateTime.now();
      final difference = now.difference(dateTime);

      if (difference.inDays > 0) {
        return '${difference.inDays}d ago';
      } else if (difference.inHours > 0) {
        return '${difference.inHours}h ago';
      } else if (difference.inMinutes > 0) {
        return '${difference.inMinutes}m ago';
      } else {
        return 'Just now';
      }
    } catch (e) {
      return 'Unknown';
    }
  }
}

