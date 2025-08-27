import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:chhoto_khabar/shared/data/local/storage_service.dart';

part 'theme_state.dart';
part 'theme_cubit.freezed.dart';

class ThemeCubit extends Cubit<ThemeState> {
  final StorageService _storageService;
  static const String _themeKey = 'theme_mode';

  ThemeCubit(this._storageService) : super(const ThemeState.initial());

  /// Initialize theme from stored preferences
  Future<void> initialize() async {
    try {
      final storedTheme = await _storageService.getString(_themeKey);
      
      if (storedTheme != null) {
        final themeMode = ThemeMode.values.firstWhere(
          (mode) => mode.toString() == storedTheme,
          orElse: () => ThemeMode.system,
        );
        emit(ThemeState.loaded(themeMode));
      } else {
        emit(const ThemeState.loaded(ThemeMode.system));
      }
    } catch (e) {
      emit(ThemeState.error('Failed to load theme: ${e.toString()}'));
    }
  }

  /// Toggle between light and dark mode
  Future<void> toggleTheme({Brightness? brightness}) async {
    try {
      final currentState = state;
      ThemeMode newThemeMode;

      if (currentState is Loaded) {
        // If we have a current theme mode, toggle based on it
        switch (currentState.themeMode) {
          case ThemeMode.light:
            newThemeMode = ThemeMode.dark;
            break;
          case ThemeMode.dark:
            newThemeMode = ThemeMode.light;
            break;
          case ThemeMode.system:
            // If system mode, toggle based on current brightness
            newThemeMode = (brightness ?? Brightness.light) == Brightness.light
                ? ThemeMode.dark
                : ThemeMode.light;
            break;
        }
      } else {
        // Default to dark if no current state
        newThemeMode = ThemeMode.dark;
      }

      await _saveThemeMode(newThemeMode);
      emit(ThemeState.loaded(newThemeMode));
    } catch (e) {
      emit(ThemeState.error('Failed to toggle theme: ${e.toString()}'));
    }
  }

  /// Set specific theme mode
  Future<void> setThemeMode(ThemeMode themeMode) async {
    try {
      await _saveThemeMode(themeMode);
      emit(ThemeState.loaded(themeMode));
    } catch (e) {
      emit(ThemeState.error('Failed to set theme: ${e.toString()}'));
    }
  }

  /// Switch to light mode
  Future<void> setLightMode() async {
    await setThemeMode(ThemeMode.light);
  }

  /// Switch to dark mode
  Future<void> setDarkMode() async {
    await setThemeMode(ThemeMode.dark);
  }

  /// Switch to system mode
  Future<void> setSystemMode() async {
    await setThemeMode(ThemeMode.system);
  }

  /// Save theme mode to storage
  Future<void> _saveThemeMode(ThemeMode themeMode) async {
    await _storageService.setString(_themeKey, themeMode.toString());
  }

  /// Get current theme mode or default
  ThemeMode get currentThemeMode {
    final currentState = state;
    if (currentState is Loaded) {
      return currentState.themeMode;
    }
    return ThemeMode.system;
  }

  /// Check if current theme is dark
  bool get isDarkMode {
    return currentThemeMode == ThemeMode.dark;
  }

  /// Check if current theme is light
  bool get isLightMode {
    return currentThemeMode == ThemeMode.light;
  }

  /// Check if current theme is system
  bool get isSystemMode {
    return currentThemeMode == ThemeMode.system;
  }
}