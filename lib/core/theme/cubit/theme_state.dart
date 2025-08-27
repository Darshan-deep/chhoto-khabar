part of 'theme_cubit.dart';

@freezed
class ThemeState with _$ThemeState {
  const factory ThemeState.initial() = Initial;
  const factory ThemeState.loaded(ThemeMode themeMode) = Loaded;
  const factory ThemeState.error(String message) = Error;
}