import 'dart:ui';

class WellnestColors {
  WellnestColors._();

  // Base surfaces
  static const Color surface = Color(0xFFFBF9F9);
  static const Color surfaceDim = Color(0xFFDBDAD9);
  static const Color surfaceBright = Color(0xFFFBF9F9);

  static const Color surfaceContainerLowest = Color(0xFFFFFFFF);
  static const Color surfaceContainerLow = Color(0xFFF5F3F3);
  static const Color surfaceContainer = Color(0xFFEFEDED);
  static const Color surfaceContainerHigh = Color(0xFFE9E8E7);
  static const Color surfaceContainerHighest = Color(0xFFE3E2E2);

  static const Color onSurface = Color(0xFF1B1C1C);
  static const Color onSurfaceVariant = Color(0xFF3C494C);

  static const Color background = Color(0xFFFBF9F9);
  static const Color onBackground = Color(0xFF1B1C1C);

  static const Color outline = Color(0xFF6C797C);
  static const Color outlineVariant = Color(0xFFBCC9CC);

  static const Color inverseSurface = Color(0xFF303031);
  static const Color inverseOnSurface = Color(0xFFF2F0F0);

  // Primary
  static const Color primary = Color(0xFF006876);
  static const Color onPrimary = Color(0xFFFFFFFF);
  static const Color primaryContainer = Color(0xFF0EB3C9);
  static const Color onPrimaryContainer = Color(0xFF004049);
  static const Color inversePrimary = Color(0xFF51D7EE);

  // Secondary
  static const Color secondary = Color(0xFF4B6267);
  static const Color onSecondary = Color(0xFFFFFFFF);
  static const Color secondaryContainer = Color(0xFFCDE7ED);
  static const Color onSecondaryContainer = Color(0xFF51686D);

  // Tertiary
  static const Color tertiary = Color(0xFF535D7E);
  static const Color onTertiary = Color(0xFFFFFFFF);
  static const Color tertiaryContainer = Color(0xFF98A2C6);
  static const Color onTertiaryContainer = Color(0xFF2E3857);

  // Error
  static const Color error = Color(0xFFBA1A1A);
  static const Color onError = Color(0xFFFFFFFF);
  static const Color errorContainer = Color(0xFFFFDAD6);
  static const Color onErrorContainer = Color(0xFF93000A);

  // Fixed colors
  static const Color primaryFixed = Color(0xFF9FEFFF);
  static const Color primaryFixedDim = Color(0xFF51D7EE);
  static const Color onPrimaryFixed = Color(0xFF001F24);
  static const Color onPrimaryFixedVariant = Color(0xFF004E59);

  static const Color secondaryFixed = Color(0xFFCDE7ED);
  static const Color secondaryFixedDim = Color(0xFFB2CBD0);
  static const Color onSecondaryFixed = Color(0xFF061F23);
  static const Color onSecondaryFixedVariant = Color(0xFF334A4F);

  static const Color tertiaryFixed = Color(0xFFDBE1FF);
  static const Color tertiaryFixedDim = Color(0xFFBBC5EB);
  static const Color onTertiaryFixed = Color(0xFF0F1A37);
  static const Color onTertiaryFixedVariant = Color(0xFF3C4665);

  // Activity
  static const Color activity = Color(0xFFE25822);
  static const Color activitySurface = Color(0xFFFDF6F3);
  static final Color activityContainer = activity.withValues(alpha: 0.05);
  static final Color activityContainerHigh = activity.withValues(alpha: 0.10);
  static final Color activityContainerHighest = activity.withValues(
    alpha: 0.20,
  );

  // Heart
  static const Color heart = Color(0xFFBA1A1A);
  static const Color heartSurface = Color(0xFFFBF3F3);
  static final Color heartContainer = heart.withValues(alpha: 0.05);
  static final Color heartContainerHigh = heart.withValues(alpha: 0.10);
  static final Color heartContainerHighest = heart.withValues(alpha: 0.20);

  // Sleep
  static const Color sleep = Color(0xFF535D7E);
  static const Color sleepSurface = Color(0xFFF6F6F8);
  static final Color sleepContainer = sleep.withValues(alpha: 0.05);
  static final Color sleepContainerHigh = sleep.withValues(alpha: 0.10);
  static final Color sleepContainerHighest = sleep.withValues(alpha: 0.20);

  static final Color sleepLight = sleep.withValues(alpha: 0.70);
  static final Color sleepRem = sleep.withValues(alpha: 0.55);
  static final Color sleepAwake = sleep.withValues(alpha: 0.40);

  // Hydration
  static const Color hydration = Color(0xFF0EB3C9);
  static const Color hydrationSurface = Color(0xFFF2FBFC);
  static final Color hydrationContainer = hydration.withValues(alpha: 0.05);
  static final Color hydrationContainerHigh = hydration.withValues(alpha: 0.10);
  static final Color hydrationContainerHighest = hydration.withValues(
    alpha: 0.20,
  );

  // Body Measurements
  static const Color measurement = Color(0xFF8B6E4E);
  static const Color measurementSurface = Color(0xFFF9F7F6);
  static final Color measurementContainer = measurement.withValues(alpha: 0.05);
  static final Color measurementContainerHigh = measurement.withValues(
    alpha: 0.10,
  );
  static final Color measurementContainerHighest = measurement.withValues(
    alpha: 0.20,
  );

  // Vital Signs
  static const Color vital = Color(0xFFAB274F);
  static const Color vitalSurface = Color(0xFFFBF4F6);
  static final Color vitalContainer = vital.withValues(alpha: 0.05);
  static final Color vitalContainerHigh = vital.withValues(alpha: 0.10);
  static final Color vitalContainerHighest = vital.withValues(alpha: 0.20);
}
