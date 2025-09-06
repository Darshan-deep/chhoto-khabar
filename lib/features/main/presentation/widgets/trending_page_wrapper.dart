import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:chhoto_khabar/features/trending/presentation/pages/trending_page_new.dart';

class TrendingPageWrapper extends StatelessWidget {
  final PageController mainPageController;

  const TrendingPageWrapper({
    super.key,
    required this.mainPageController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragEnd: (details) {
        // Right swipe to go back to news feed
        if (details.primaryVelocity! > 500) {
          HapticFeedback.mediumImpact();
          mainPageController.previousPage(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
      },
      child: const Column(
        children: [
          Expanded(
            child: TrendingPageNew(),
          ),
        ],
      ),
    );
  }
}
