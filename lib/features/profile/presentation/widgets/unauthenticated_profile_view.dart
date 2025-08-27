import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:chhoto_khabar/features/profile/presentation/widgets/language_selection_widget.dart';

class UnauthenticatedProfileView extends StatelessWidget {
  const UnauthenticatedProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Hero Icon
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.person_outline,
              size: 80,
              color: theme.colorScheme.onSurface.withOpacity(0.6),
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Title
          Text(
            'Welcome to Chhoto Khabar',
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: theme.colorScheme.onSurface,
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 16),
          
          // Subtitle
          Text(
            'Sign in to access your profile, bookmarks, and personalized content',
            style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
          
          const SizedBox(height: 48),
          
          // Benefits Section
          _buildBenefitsSection(context),
          
          const SizedBox(height: 32),
          
          // Language Selection
          const LanguageSelectionWidget(),
          
          const SizedBox(height: 32),
          
          // Action Buttons
          _buildActionButtons(context),
          
          const SizedBox(height: 24),
          
          // Guest Option
          _buildGuestOption(context),
        ],
      ),
    );
  }

  Widget _buildBenefitsSection(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Text(
          'Why create an account?',
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        _buildBenefitItem(
          context,
          Icons.bookmark,
          'Save Articles',
          'Bookmark your favorite articles to read later',
        ),
        const SizedBox(height: 12),
        _buildBenefitItem(
          context,
          Icons.person,
          'Personalized Experience',
          'Get content recommendations based on your interests',
        ),
        const SizedBox(height: 12),
        _buildBenefitItem(
          context,
          Icons.sync,
          'Sync Across Devices',
          'Access your saved content from any device',
        ),
      ],
    );
  }

  Widget _buildBenefitItem(
    BuildContext context,
    IconData icon,
    String title,
    String description,
  ) {
    final theme = Theme.of(context);

    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            color: theme.colorScheme.primary,
            size: 20,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                description,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => context.go('/login'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Sign In',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
            onPressed: () => context.go('/register'),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Create Account',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildGuestOption(BuildContext context) {
    final theme = Theme.of(context);

    return TextButton(
      onPressed: () => context.go('/'),
      child: Text(
        'Continue as Guest',
        style: TextStyle(
          color: theme.colorScheme.onSurface.withOpacity(0.7),
          decoration: TextDecoration.underline,
        ),
      ),
    );
  }
}