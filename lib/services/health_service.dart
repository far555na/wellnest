import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthService {
  final Health health = Health();

  final List<HealthDataType> types = [
    HealthDataType.STEPS,
    HealthDataType.HEART_RATE,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.TOTAL_CALORIES_BURNED,
  ];

  Future<bool> initHealth() async {
    // For steps permission on Android
    await Permission.activityRecognition.request();

    await health.configure();

    final types = [
      HealthDataType.STEPS,
      HealthDataType.HEART_RATE,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.TOTAL_CALORIES_BURNED,
    ];

    final permissions = [
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
      HealthDataAccess.READ,
    ];

    final granted = await health.requestAuthorization(
      types,
      permissions: permissions,
    );

    return granted;
  }

  Future<int> getTodaySteps() async {
    final now = DateTime.now();
    final midnight = DateTime(now.year, now.month, now.day);

    final steps = await health.getTotalStepsInInterval(midnight, now);

    return steps ?? 0;
  }

  Future<List<HealthDataPoint>> getHealthData() async {
    final now = DateTime.now();
    final yesterday = now.subtract(const Duration(days: 1));

    final data = await health.getHealthDataFromTypes(
      types: types,
      startTime: yesterday,
      endTime: now,
    );

    return health.removeDuplicates(data);
  }

  Future<double?> getLatestHeartRate() async {
    await health.configure();

    final now = DateTime.now();
    final startTime = now.subtract(const Duration(days: 1));

    final data = await health.getHealthDataFromTypes(
      types: [HealthDataType.HEART_RATE],
      startTime: startTime,
      endTime: now,
    );

    if (data.isEmpty) {
      return null;
    }

    data.sort((a, b) => b.dateTo.compareTo(a.dateTo));

    final latest = data.first;

    final value = latest.value;

    if (value is NumericHealthValue) {
      return value.numericValue.toDouble();
    }

    return null;
  }
}
