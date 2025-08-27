
import 'package:chhoto_khabar/features/news_feed/data/models/article_model.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareBottomSheet extends StatelessWidget {
  final ArticleModel article;

  const ShareBottomSheet({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Text(
                  'Share Article',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => _shareGeneral(context),
                    child: const Text('Share'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _shareGeneral(BuildContext context) async {
    final String shareText =
        '${article.content.title['en'] ?? 'News Article'}\n\n${article.content.summary['en'] ?? ''}\n\nRead more: ${article.content.sourceUrl ?? ''}';
    try {
      await Share.share(shareText);
    } catch (e) {
      print('Error sharing generally: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error sharing article'),
          backgroundColor: Colors.red,
        ),
      );
    }
    Navigator.pop(context);
  }
}