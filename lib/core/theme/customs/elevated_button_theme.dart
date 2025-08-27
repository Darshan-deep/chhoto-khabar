import 'package:flutter/material.dart';

ElevatedButtonThemeData elevatedButtonTheme(
    BuildContext context, ColorScheme colorScheme) {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.5),
      disabledForegroundColor: colorScheme.onPrimary,
      minimumSize: const Size(double.infinity, 50),
      textStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
          color: Theme.of(context).colorScheme.surface,
          fontWeight: FontWeight.w500),
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.surface,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}
