import 'package:flutter/material.dart';

class CustomChipTheme {
  static ChipThemeData lightChipTheme = ChipThemeData(
    backgroundColor: Colors.grey[200],
    selectedColor: const Color(0xFF1976D2),
    disabledColor: Colors.grey[300],
    deleteIconColor: Colors.grey[700],
    labelStyle: const TextStyle(color: Colors.black87),
    secondaryLabelStyle: const TextStyle(color: Colors.white),
    brightness: Brightness.light,
  );

  static ChipThemeData darkChipTheme = ChipThemeData(
    backgroundColor: Colors.grey[800],
    selectedColor: const Color(0xFF90CAF9),
    disabledColor: Colors.grey[700],
    deleteIconColor: Colors.grey[400],
    labelStyle: const TextStyle(color: Colors.white70),
    secondaryLabelStyle: const TextStyle(color: Colors.black87),
    brightness: Brightness.dark,
  );
}
