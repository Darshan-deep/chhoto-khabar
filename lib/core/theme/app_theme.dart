import 'package:chhoto_khabar/core/theme/customs/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:chhoto_khabar/core/theme/customs/chip_theme.dart';
import 'package:chhoto_khabar/core/theme/customs/elevated_button_theme.dart';
import 'package:chhoto_khabar/core/theme/customs/outlined_button_theme.dart';
import 'package:chhoto_khabar/core/theme/customs/text_field_theme.dart';
import 'package:chhoto_khabar/core/theme/customs/text_theme.dart';


class PatientAppTheme {
  PatientAppTheme._();

  static ThemeData patientLightThemeData(BuildContext context) {
    return ThemeData(
      colorScheme: lightColorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: lightColorScheme.surface,
      inputDecorationTheme:
          TTextFieldTheme.inputDecorationTheme(lightColorScheme),
      textTheme: TTextTheme.textTheme(const Color(0xFF191c1f)),
      appBarTheme: AppBarTheme(
        backgroundColor: lightColorScheme.surface,
        elevation: 0,
        iconTheme: IconThemeData(
          color: lightColorScheme.onSurface,
        ),
        shadowColor: lightColorScheme.onSurface.withAlpha(30),
        surfaceTintColor: lightColorScheme.surface,
        titleTextStyle: TextStyle(
          color: lightColorScheme.onSurface,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
      elevatedButtonTheme: elevatedButtonTheme(context, lightColorScheme),
      outlinedButtonTheme: outlinedButtonTheme(lightColorScheme),
      cardTheme: CardThemeData(
        color: lightColorScheme.surface,
        elevation: 10,
        shadowColor: lightColorScheme.shadow,
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: lightColorScheme.surface,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(12),
          ),
        ),
      ),
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateColor.resolveWith(
          (states) {
            if (states.contains(WidgetState.disabled)) {
              return lightColorScheme.surface;
            }
            if (states.contains(WidgetState.selected)) {
              return lightColorScheme.primary;
            }
            return lightColorScheme.onPrimary;
          },
        ),
        checkColor: WidgetStateProperty.all(lightColorScheme.onSecondary),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        side: BorderSide(
          width: 1.2,
          color: lightColorScheme.outline,
        ),
      ),
      chipTheme: CustomChipTheme.lightChipTheme,
    );
  }
}
