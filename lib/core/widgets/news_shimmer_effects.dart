import 'package:flutter/material.dart';
import 'package:chhoto_khabar/core/utils/shimmer.dart';

class NewsShimmerEffects {
  // Article card shimmer for news items
  static Widget articleCard({
    double height = 120,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image shimmer
          Shimmer(
            width: 100,
            height: height,
            borderRadius: 12,
          ),
          const SizedBox(width: 12),
          // Content shimmer
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title lines
                Shimmer(
                  width: double.infinity,
                  height: 16,
                  borderRadius: 4,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                Shimmer(
                  width: 200,
                  height: 16,
                  borderRadius: 4,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                // Subtitle line
                Shimmer(
                  width: 150,
                  height: 14,
                  borderRadius: 4,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                const Spacer(),
                // Date and source
                Row(
                  children: [
                    Shimmer(
                      width: 80,
                      height: 12,
                      borderRadius: 4,
                    ),
                    const SizedBox(width: 8),
                    Shimmer(
                      width: 60,
                      height: 12,
                      borderRadius: 4,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Hero article shimmer for featured content
  static Widget heroArticle({
    double height = 200,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Large image shimmer
          Shimmer(
            width: double.infinity,
            height: height,
            borderRadius: 12,
          ),
          const SizedBox(height: 12),
          // Title
          Shimmer(
            width: double.infinity,
            height: 18,
            borderRadius: 4,
            margin: const EdgeInsets.only(bottom: 8),
          ),
          Shimmer(
            width: 250,
            height: 18,
            borderRadius: 4,
            margin: const EdgeInsets.only(bottom: 8),
          ),
          // Description
          Shimmer(
            width: double.infinity,
            height: 14,
            borderRadius: 4,
            margin: const EdgeInsets.only(bottom: 4),
          ),
          Shimmer(
            width: 180,
            height: 14,
            borderRadius: 4,
            margin: const EdgeInsets.only(bottom: 8),
          ),
          // Metadata
          Row(
            children: [
              Shimmer(
                width: 100,
                height: 12,
                borderRadius: 4,
              ),
              const SizedBox(width: 12),
              Shimmer(
                width: 80,
                height: 12,
                borderRadius: 4,
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Grid shimmer for trending news
  static Widget gridItem({
    double aspectRatio = 1.0,
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image shimmer with aspect ratio
          AspectRatio(
            aspectRatio: aspectRatio,
            child: Shimmer(
              width: double.infinity,
              borderRadius: 12,
            ),
          ),
          const SizedBox(height: 8),
          // Title lines
          Shimmer(
            width: double.infinity,
            height: 16,
            borderRadius: 4,
            margin: const EdgeInsets.only(bottom: 4),
          ),
          Shimmer(
            width: 120,
            height: 16,
            borderRadius: 4,
            margin: const EdgeInsets.only(bottom: 8),
          ),
          // Metadata
          Shimmer(
            width: 80,
            height: 12,
            borderRadius: 4,
          ),
        ],
      ),
    );
  }

  // Category chip shimmer
  static Widget categoryChip({
    EdgeInsetsGeometry? margin,
  }) {
    return Shimmer(
      width: 80,
      height: 32,
      borderRadius: 16,
      margin: margin ?? const EdgeInsets.only(right: 8),
    );
  }

  // Search suggestion shimmer
  static Widget searchSuggestion({
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Shimmer(
            width: 20,
            height: 20,
            borderRadius: 10,
          ),
          const SizedBox(width: 12),
          Shimmer(
            width: 150,
            height: 16,
            borderRadius: 4,
          ),
        ],
      ),
    );
  }

  // Notification item shimmer
  static Widget notificationItem({
    EdgeInsetsGeometry? margin,
  }) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Shimmer(
            width: 50,
            height: 50,
            borderRadius: 25,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Shimmer(
                  width: double.infinity,
                  height: 16,
                  borderRadius: 4,
                  margin: const EdgeInsets.only(bottom: 4),
                ),
                Shimmer(
                  width: 200,
                  height: 14,
                  borderRadius: 4,
                  margin: const EdgeInsets.only(bottom: 4),
                ),
                Shimmer(
                  width: 100,
                  height: 12,
                  borderRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Grid layout shimmer
  static Widget buildGrid({
    int itemCount = 6,
    int crossAxisCount = 2,
    double childAspectRatio = 0.8,
    EdgeInsetsGeometry? padding,
  }) {
    return GridView.builder(
      padding: padding ?? const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: childAspectRatio,
      ),
      itemCount: itemCount,
      itemBuilder: (context, index) => gridItem(),
    );
  }

  // List layout shimmer
  static Widget buildList({
    int itemCount = 5,
    EdgeInsetsGeometry? padding,
  }) {
    return ListView.builder(
      padding: padding ?? const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => articleCard(),
    );
  }

  // Category list shimmer
  static Widget buildCategoryList({
    int itemCount = 8,
    EdgeInsetsGeometry? padding,
  }) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16),
        itemCount: itemCount,
        itemBuilder: (context, index) => categoryChip(),
      ),
    );
  }

  // Search suggestions shimmer
  static Widget buildSearchSuggestions({
    int itemCount = 6,
    EdgeInsetsGeometry? padding,
  }) {
    return Column(
      children: List.generate(
        itemCount,
        (index) => searchSuggestion(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        ),
      ),
    );
  }

  // Notification list shimmer
  static Widget buildNotificationList({
    int itemCount = 5,
    EdgeInsetsGeometry? padding,
  }) {
    return ListView.builder(
      padding: padding ?? const EdgeInsets.all(16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: itemCount,
      itemBuilder: (context, index) => notificationItem(),
    );
  }
}
