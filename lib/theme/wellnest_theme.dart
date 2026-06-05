import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';

class WellnestTheme {
  WellnestTheme._();

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: WellnestColors.surface,

      colorScheme: const ColorScheme.light(
        surface: WellnestColors.surface,
        surfaceDim: WellnestColors.surfaceDim,
        surfaceBright: WellnestColors.surfaceBright,
        primary: WellnestColors.primary,
        onPrimary: WellnestColors.onPrimary,
        primaryContainer: WellnestColors.primaryContainer,
        onPrimaryContainer: WellnestColors.onPrimaryContainer,
        secondary: WellnestColors.secondary,
        onSecondary: WellnestColors.onSecondary,
        secondaryContainer: WellnestColors.secondaryContainer,
        onSecondaryContainer: WellnestColors.onSecondaryContainer,
        tertiary: WellnestColors.tertiary,
        onTertiary: WellnestColors.onTertiary,
        tertiaryContainer: WellnestColors.tertiaryContainer,
        onTertiaryContainer: WellnestColors.onTertiaryContainer,
        error: WellnestColors.error,
        onError: WellnestColors.onError,
        errorContainer: WellnestColors.errorContainer,
        onErrorContainer: WellnestColors.onErrorContainer,
        background: WellnestColors.background,
        onBackground: WellnestColors.onBackground,
        onSurface: WellnestColors.onSurface,
        onSurfaceVariant: WellnestColors.onSurfaceVariant,
        outline: WellnestColors.outline,
        outlineVariant: WellnestColors.outlineVariant,
        inverseSurface: WellnestColors.inverseSurface,
        onInverseSurface: WellnestColors.inverseOnSurface,
        inversePrimary: WellnestColors.inversePrimary,
      ),

      fontFamily: 'Be Vietnam Pro',

      // appBarTheme: const AppBarTheme(
      //   backgroundColor: WellnestColors.background,
      //   foregroundColor: WellnestColors.onBackground,
      //   elevation: 0,
      //   centerTitle: false,
      //   surfaceTintColor: Colors.transparent,
      // ),

      // cardTheme: CardThemeData(
      //   color: WellnestColors.surfaceContainerLowest,
      //   elevation: 0,
      //   margin: EdgeInsets.zero,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(WellnestRadius.md),
      //   ),
      // ),

      // bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      //   backgroundColor: WellnestColors.surfaceContainerLowest,
      //   selectedItemColor: WellnestColors.primary,
      //   unselectedItemColor: WellnestColors.outline,
      //   type: BottomNavigationBarType.fixed,
      //   elevation: 0,
      // ),

      // floatingActionButtonTheme: const FloatingActionButtonThemeData(
      //   backgroundColor: WellnestColors.primary,
      //   foregroundColor: WellnestColors.onPrimary,
      //   elevation: 0,
      // ),

      // elevatedButtonTheme: ElevatedButtonThemeData(
      //   style: ElevatedButton.styleFrom(
      //     backgroundColor: WellnestColors.primary,
      //     foregroundColor: WellnestColors.onPrimary,
      //     elevation: 0,
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: WellnestSpacing.md,
      //       vertical: WellnestSpacing.sm,
      //     ),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(WellnestRadius.full),
      //     ),
      //     textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      //   ),
      // ),

      // outlinedButtonTheme: OutlinedButtonThemeData(
      //   style: OutlinedButton.styleFrom(
      //     foregroundColor: WellnestColors.primary,
      //     side: const BorderSide(color: WellnestColors.outlineVariant),
      //     padding: const EdgeInsets.symmetric(
      //       horizontal: WellnestSpacing.md,
      //       vertical: WellnestSpacing.sm,
      //     ),
      //     shape: RoundedRectangleBorder(
      //       borderRadius: BorderRadius.circular(WellnestRadius.full),
      //     ),
      //   ),
      // ),

      // inputDecorationTheme: InputDecorationTheme(
      //   filled: true,
      //   fillColor: WellnestColors.surfaceContainerLow,
      //   border: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(WellnestRadius.md),
      //     borderSide: BorderSide.none,
      //   ),
      //   enabledBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(WellnestRadius.md),
      //     borderSide: BorderSide.none,
      //   ),
      //   focusedBorder: OutlineInputBorder(
      //     borderRadius: BorderRadius.circular(WellnestRadius.md),
      //     borderSide: const BorderSide(
      //       color: WellnestColors.primary,
      //       width: 1.5,
      //     ),
      //   ),
      //   contentPadding: const EdgeInsets.symmetric(
      //     horizontal: WellnestSpacing.md,
      //     vertical: WellnestSpacing.sm,
      //   ),
      // ),

      textTheme: const TextTheme(

        displayLarge: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 48,
          height: 60 / 48,
          fontWeight: FontWeight.w700,
          letterSpacing: 0,
          color: WellnestColors.onSurface,
        ),

        headlineLarge: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 32,
          height: 40 / 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.64, // -2% of 32
          color: WellnestColors.onSurface,
        ),

        headlineMedium: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 28,
          height: 36 / 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.28, // -1% of 28
          color: WellnestColors.onSurface,
        ),

        headlineSmall: TextStyle(
          fontFamily: 'Plus Jakarta Sans',
          fontSize: 24,
          height: 32 / 24,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: WellnestColors.onSurface,
        ),

        titleLarge: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontSize: 20,
          height: 28 / 20,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: WellnestColors.onSurface,
        ),

        labelLarge: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontSize: 16,
          height: 24 / 16,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          color: WellnestColors.onSurface,
        ),

        labelMedium: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.14, // 1% of 14
          color: WellnestColors.onSurface,
        ),

        labelSmall: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontSize: 12,
          height: 16 / 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0,
          color: WellnestColors.onSurfaceVariant,
        ),

        bodyLarge: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontSize: 18,
          height: 28 / 18,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: WellnestColors.onSurface,
        ),

        bodyMedium: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontSize: 16,
          height: 22 / 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: WellnestColors.onSurface,
        ),

        bodySmall: TextStyle(
          fontFamily: 'Be Vietnam Pro',
          fontSize: 14,
          height: 20 / 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0,
          color: WellnestColors.onSurfaceVariant,
        ),
      ),
    );
  }
}
