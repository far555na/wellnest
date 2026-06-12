import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:wellnest/services/health_service.dart';

class ActivityService extends HealthService {
  final List<HealthDataType> types = const [
    HealthDataType.STEPS,
    HealthDataType.DISTANCE_DELTA,
    HealthDataType.SPEED,
  ];

 Future<bool> initActivityService() async {
    return initHealth(types);
  }

  Future<int> getTodaySteps() async {
    final steps = await health.getTotalStepsInInterval(
      startOfToday,
      now,
    );

    return steps ?? 0;
  }

  Future<List<double>> getTodayHourlySteps() async {
  final List<double> hourlySteps = [];

  // final currentNow = DateTime.now();
  // final startOfToday = DateTime(
  //   currentNow.year,
  //   currentNow.month,
  //   currentNow.day,
  // );

  for (int hour = 0; hour < 24; hour++) {
    final start = startOfToday.add(Duration(hours: hour));
    final end = startOfToday.add(Duration(hours: hour + 1));

    // Do not fetch future hours
    if (start.isAfter(now)) {
      hourlySteps.add(0);
      continue;
    }

    final safeEnd = end.isAfter(now) ? now : end;

    try {
      final steps = await health.getTotalStepsInInterval(start, safeEnd);
      hourlySteps.add((steps ?? 0).toDouble());
    } catch (error) {
      debugPrint('Error getting steps for hour $hour: $error');
      hourlySteps.add(0);
    }
  }

  debugPrint('Hourly steps: $hourlySteps');

  return hourlySteps;
}

  Future<double> getTodayDistanceKm() async {
  final rawData = await health.getHealthDataFromTypes(
    types: [HealthDataType.DISTANCE_DELTA],
    startTime: startOfToday,
    endTime: now,
  );

  final data = health.removeDuplicates(rawData);

  double totalMeters = 0;

  for (final point in data) {
    final value = point.value;

    if (value is NumericHealthValue) {
      totalMeters += value.numericValue.toDouble();
    }
  }

  return totalMeters / 1000;
}

  Future<double> getTodayAverageSpeedKmh() async {
    final distanceKm = await getTodayDistanceKm();

    final hours = now.difference(startOfToday).inMinutes / 60;

    if (hours <= 0) return 0;

    return distanceKm / hours;
  }
}
