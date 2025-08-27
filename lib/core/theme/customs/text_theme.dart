import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme textTheme(Color textColor) {
    return TextTheme(
      displayLarge: GoogleFonts.manrope(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.13,
      ),
      displayMedium: GoogleFonts.manrope(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF020202),
        height: 1.15,
      ),
      displaySmall: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: const Color(0xFF020202),
        height: 1.22,
      ),
      headlineLarge: GoogleFonts.manrope(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.25,
      ),
      headlineMedium: GoogleFonts.manrope(
        fontSize: 28,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.28,
      ),
      headlineSmall: GoogleFonts.manrope(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: textColor,
        height: 1.33,
      ),
      titleLarge: GoogleFonts.manrope(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.5,
      ),
      titleMedium: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w200,
        color: textColor,
        height: 1.5,
      ),
      titleSmall: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.5,
      ),
      bodyLarge: GoogleFonts.manrope(
        fontSize: 18,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.5,
      ),
      bodyMedium: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.43,
      ),
      bodySmall: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.33,
      ),
      labelLarge: GoogleFonts.manrope(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: textColor,
        height: 1.42,
      ),
      labelMedium: GoogleFonts.manrope(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: textColor,
        height: 1.33,
      ),
      labelSmall: GoogleFonts.manrope(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: textColor,
        height: 1.45,
      ),
    );
  }
}
