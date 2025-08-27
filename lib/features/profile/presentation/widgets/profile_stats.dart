import 'package:chhoto_khabar/l10n/app_localizations_unified.dart';
import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final AppLocalizations l10n;

  const ProfileStats({
    Key? key,
    required this.l10n,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildStat('Article read', '125', theme),
        _buildDivider(theme),
        _buildStat('Bookmarks', '32', theme),
        _buildDivider(theme),
        _buildStat('Comments', '18', theme),
      ],
    );
  }

  Widget _buildStat(String label, String value, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.7),
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(ThemeData theme) {
    return Container(
      height: 40,
      width: 1,
      color: theme.colorScheme.onSurface.withOpacity(0.2),
    );
  }
}
