import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primary = Color(0xFF136964);
  static const Color onPrimary = Color(0xFFFFFFFF);

  static const Color primaryContainer = Color(0xFF80CBC4);
  static const Color onPrimaryContainer = Color(0xFF005652);

  static const Color secondary = Color(0xFF526069);
  static const Color secondaryContainer = Color(0xFFD3E2ED);

  static const Color tertiary = Color(0xFF7B5549);
  static const Color tertiaryContainer = Color(0xFFE4B3A4);

  static const Color background = Color(0xFFF9F9F9);
  static const Color surface = Color(0xFFF9F9F9);
  static const Color surfaceContainer = Color(0xFFEEEEEE);
  static const Color surfaceContainerLow = Color(0xFFF3F3F3);
  static const Color surfaceContainerHighest = Color(0xFFE2E2E2);

  static const Color onSurface = Color(0xFF1A1C1C);
  static const Color onSurfaceVariant = Color(0xFF3F4947);

  static const Color outline = Color(0xFF6F7977);
  static const Color outlineVariant = Color(0xFFBEC9C7);

  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: background,

    colorScheme: const ColorScheme.light(
      primary: primary,
      onPrimary: onPrimary,
      primaryContainer: primaryContainer,
      onPrimaryContainer: onPrimaryContainer,
      secondary: secondary,
      onSecondary: Colors.white,
      secondaryContainer: secondaryContainer,
      onSecondaryContainer: Color(0xFF56656E),
      tertiary: tertiary,
      onTertiary: Colors.white,
      tertiaryContainer: tertiaryContainer,
      onTertiaryContainer: Color(0xFF684438),
      error: error,
      onError: onError,
      errorContainer: errorContainer,
      surface: surface,
      onSurface: onSurface,
      onSurfaceVariant: onSurfaceVariant,
      outline: outline,
      outlineVariant: outlineVariant,
    ),

    textTheme: TextTheme(
      headlineLarge: GoogleFonts.lexend(
        fontSize: 40,
        fontWeight: FontWeight.w500,
        height: 48 / 40,
        letterSpacing: -0.8,
        color: onSurface,
      ),
      headlineMedium: GoogleFonts.lexend(
        fontSize: 28,
        fontWeight: FontWeight.w500,
        height: 36 / 28,
        color: onSurface,
      ),
      headlineSmall: GoogleFonts.lexend(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        height: 28 / 22,
        color: onSurface,
      ),
      bodyLarge: GoogleFonts.lexend(
        fontSize: 18,
        fontWeight: FontWeight.w300,
        height: 28 / 18,
        color: onSurface,
      ),
      bodyMedium: GoogleFonts.lexend(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        height: 24 / 16,
        color: onSurface,
      ),
      labelMedium: GoogleFonts.lexend(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 20 / 14,
        letterSpacing: 0.14,
        color: onSurfaceVariant,
      ),
      labelSmall: GoogleFonts.lexend(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 16 / 12,
        letterSpacing: 0.03 * 16,
      ),
    ),

    appBarTheme: AppBarTheme(
      elevation: 0,
      centerTitle: false,
      backgroundColor: background,
      foregroundColor: onSurface,
      titleTextStyle: GoogleFonts.lexend(
        fontSize: 22,
        fontWeight: FontWeight.w500,
        color: onSurface,
      ),
    ),

    cardTheme: CardThemeData(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      shadowColor: Colors.black
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        elevation: 0,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        textStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
      ),
    ),

    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        backgroundColor: primary,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        textStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primary,
        side: BorderSide.none,
        backgroundColor: primary,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(999),
        ),
        textStyle: GoogleFonts.lexend(
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: surfaceContainerLow,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: const BorderSide(
          color: primary,
          width: 1.5,
        ),
      ),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      hintStyle: GoogleFonts.lexend(
        color: onSurfaceVariant,
        fontWeight: FontWeight.w300,
      ),
    ),

    chipTheme: ChipThemeData(
      backgroundColor: primary,
      selectedColor: primaryContainer,
      labelStyle: GoogleFonts.lexend(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(999),
      ),
      side: BorderSide.none,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: primary,
      linearTrackColor: surfaceContainerHighest,
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: primary,
      unselectedItemColor: onSurfaceVariant,
      selectedLabelStyle: GoogleFonts.lexend(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: GoogleFonts.lexend(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
  );
}