import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:chhoto_khabar/features/trending/presentation/bloc/trending_bloc.dart';
import 'package:chhoto_khabar/features/trending/presentation/pages/trending_page_new.dart';
import 'package:chhoto_khabar/shared/utils/auth_error_handler.dart';

class TrendingPageWrapper extends StatelessWidget {
  final PageController mainPageController;

  const TrendingPageWrapper({
    super.key,
    required this.mainPageController,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<TrendingBloc, TrendingState>(
      listener: (context, state) {
        state.whenOrNull(
          error: (message) {
            if (AuthErrorHelper.isAuthError(message)) {
              AuthErrorHelper.showAuthDialog(context, 'interact with trending articles');
            }
          },
        );
      },
      child: GestureDetector(
        onHorizontalDragEnd: (details) {
          // Left swipe to go back to news feed
          if (details.primaryVelocity! < -500) {
            HapticFeedback.mediumImpact();
            mainPageController.previousPage(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          }
          // Right swipe to go back to news feed (keeping the original functionality)
          else if (details.primaryVelocity! > 500) {
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
      ),
    );
  }
}
