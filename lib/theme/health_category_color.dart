import 'dart:ui';

import 'package:wellnest/theme/wellnest_color.dart';

class HealthCategoryColor {
  final Color main;
  final Color surface;
  final Color container;
  final Color containerHigh;
  final Color containerHighest;

  const HealthCategoryColor({
    required this.main,
    required this.surface,
    required this.container,
    required this.containerHigh,
    required this.containerHighest,
  });
}

class HealthCategories {
  HealthCategories._();

  static final activity = HealthCategoryColor(
    main: WellnestColors.activity,
    surface: WellnestColors.activitySurface,
    container: WellnestColors.activityContainer,
    containerHigh: WellnestColors.activityContainerHigh,
    containerHighest: WellnestColors.activityContainerHighest,
  );

  static final heart =  HealthCategoryColor(
    main: WellnestColors.heart,
    surface: WellnestColors.heartSurface,
    container: WellnestColors.heartContainer,
    containerHigh: WellnestColors.heartContainerHigh,
    containerHighest: WellnestColors.heartContainerHighest,
  );

  static final sleep =  HealthCategoryColor(
    main: WellnestColors.sleep,
    surface: WellnestColors.sleepSurface,
    container: WellnestColors.sleepContainer,
    containerHigh: WellnestColors.sleepContainerHigh,
    containerHighest: WellnestColors.sleepContainerHighest,
  );

  static final hydration = HealthCategoryColor(
    main: WellnestColors.hydration,
    surface: WellnestColors.hydrationSurface,
    container: WellnestColors.hydrationContainer,
    containerHigh: WellnestColors.hydrationContainerHigh,
    containerHighest: WellnestColors.hydrationContainerHighest,
  );

  static final measurement = HealthCategoryColor(
    main: WellnestColors.measurement,
    surface: WellnestColors.measurementSurface,
    container: WellnestColors.measurementContainer,
    containerHigh: WellnestColors.measurementContainerHigh,
    containerHighest: WellnestColors.measurementContainerHighest,
  );

  static final vital = HealthCategoryColor(
    main: WellnestColors.vital,
    surface: WellnestColors.vitalSurface,
    container: WellnestColors.vitalContainer,
    containerHigh: WellnestColors.vitalContainerHigh,
    containerHighest: WellnestColors.vitalContainerHighest,
  );
}