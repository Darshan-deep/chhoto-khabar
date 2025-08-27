import 'package:flutter/material.dart';

OutlinedButtonThemeData outlinedButtonTheme(ColorScheme colorScheme) {
  return OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      side: BorderSide(width: 1, color: colorScheme.primary),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      minimumSize: const Size(double.infinity, 50),
      textStyle: TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 14,
        color: colorScheme.primary,
      ),
      foregroundColor: colorScheme.primary,
      elevation: 0,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
  );
}
