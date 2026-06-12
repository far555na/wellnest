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
