import 'package:flutter/material.dart';
import 'package:health/health.dart';
import 'package:wellnest/services/health_service.dart';

class ActivityService extends HealthService {
  final List<HealthDataType> types = const [
    HealthDataType.STEPS,
    HealthDataType.DISTANCE_DELTA,
    HealthDataType.SPEED,
  ];

  DateTime _startOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day);
  }

  DateTime _endOfDay(DateTime date) {
    return DateTime(date.year, date.month, date.day, 23, 59, 59);
  }

  DateTime _safeEndOfDay(DateTime date) {
    final now = DateTime.now();
    final endOfDay = _endOfDay(date);

    // If selected date is today, only fetch until now.
    if (_isSameDay(date, now)) {
      return now;
    }

    return endOfDay;
  }

  bool _isSameDay(DateTime a, DateTime b) {
    return a.year == b.year && a.month == b.month && a.day == b.day;
  }

  Future<bool> initActivityService() async {
    return initHealth(types);
  }

  Future<Set<DateTime>> getDatesWithStepData({required DateTime month}) async {
    final startOfMonth = DateTime(month.year, month.month, 1);
    final endOfMonth = DateTime(month.year, month.month + 1, 1);

    final data = await health.getHealthDataFromTypes(
      types: [HealthDataType.STEPS],
      startTime: startOfMonth,
      endTime: endOfMonth,
    );

    final datesWithData = <DateTime>{};

    for (final point in data) {
      final date = point.dateFrom;
      datesWithData.add(DateTime(date.year, date.month, date.day));
    }

    return datesWithData;
  }

  // -------------------------
  // Steps
  // -------------------------

  Future<int> getStepsByDate(DateTime date) async {
    final start = _startOfDay(date);
    final end = _safeEndOfDay(date);

    try {
      final steps = await health.getTotalStepsInInterval(start, end);

      return steps ?? 0;
    } catch (error) {
      debugPrint('Error getting steps by date: $error');
      return 0;
    }
  }

  Future<int> getTodaySteps() async {
    return getStepsByDate(DateTime.now());
  }

  // -------------------------
  // Hourly Steps
  // -------------------------

  Future<List<double>> getHourlyStepsByDate(DateTime date) async {
    final List<double> hourlySteps = [];

    final startOfSelectedDay = _startOfDay(date);
    final now = DateTime.now();

    for (int hour = 0; hour < 24; hour++) {
      final start = startOfSelectedDay.add(Duration(hours: hour));
      final end = startOfSelectedDay.add(Duration(hours: hour + 1));

      // Do not fetch future hours if selected date is today.
      if (_isSameDay(date, now) && start.isAfter(now)) {
        hourlySteps.add(0);
        continue;
      }

      final safeEnd = _isSameDay(date, now) && end.isAfter(now) ? now : end;

      try {
        final steps = await health.getTotalStepsInInterval(start, safeEnd);
        hourlySteps.add((steps ?? 0).toDouble());
      } catch (error) {
        debugPrint('Error getting steps for hour $hour: $error');
        hourlySteps.add(0);
      }
    }

    debugPrint('Hourly steps for $date: $hourlySteps');

    return hourlySteps;
  }

  Future<List<double>> getTodayHourlySteps() async {
    return getHourlyStepsByDate(DateTime.now());
  }

  // -------------------------
  // Distance
  // -------------------------

  Future<double> getDistanceKmByDate(DateTime date) async {
    final start = _startOfDay(date);
    final end = _safeEndOfDay(date);

    try {
      final rawData = await health.getHealthDataFromTypes(
        types: [HealthDataType.DISTANCE_DELTA],
        startTime: start,
        endTime: end,
      );

      final data = health.removeDuplicates(rawData);

      double totalMeters = 0;

      for (final point in data) {
        final value = point.value;

        if (value is NumericHealthValue) {
          totalMeters += value.numericValue.toDouble();
        }
      }

      final distanceKm = totalMeters / 1000;

      return distanceKm;
    } catch (error) {
      debugPrint('Error getting distance by date: $error');
      return 0;
    }
  }

  Future<double> getTodayDistanceKm() async {
    return getDistanceKmByDate(DateTime.now());
  }

  // -------------------------
  // Average Speed
  // -------------------------

  Future<double> getAverageSpeedKmhByDate(DateTime date) async {
    final distanceKm = await getDistanceKmByDate(date);

    final start = _startOfDay(date);
    final end = _safeEndOfDay(date);

    final hours = end.difference(start).inMinutes / 60;

    if (hours <= 0) return 0;

    return distanceKm / hours;
  }

  Future<double> getTodayAverageSpeedKmh() async {
    return getAverageSpeedKmhByDate(DateTime.now());
  }
}