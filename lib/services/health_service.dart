import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthService {
  final Health _health = Health();

  final List<HealthDataType> _types = const [
    HealthDataType.STEPS,
    HealthDataType.HEART_RATE,
    HealthDataType.SLEEP_ASLEEP,
    HealthDataType.ACTIVE_ENERGY_BURNED,
  ];

  List<HealthDataAccess> get _permissions {
    return _types.map((_) => HealthDataAccess.READ).toList();
  }

  DateTime get _now => DateTime.now();

  DateTime get _startOfToday {
    final now = _now;
    return DateTime(now.year, now.month, now.day);
  }

  DateTime get _yesterday {
    return _now.subtract(const Duration(days: 1));
  }

  Future<bool> initHealth() async {
    await Permission.activityRecognition.request();

    await _health.configure();

    final granted = await _health.requestAuthorization(
      _types,
      permissions: _permissions,
    );

    return granted;
  }

  Future<int> getTodaySteps() async {
    final steps = await _health.getTotalStepsInInterval(
      _startOfToday,
      _now,
    );

    return steps ?? 0;
  }

  Future<List<HealthDataPoint>> getHealthData() async {
    final data = await _health.getHealthDataFromTypes(
      types: _types,
      startTime: _yesterday,
      endTime: _now,
    );

    return _health.removeDuplicates(data);
  }

  Future<double?> getLatestHeartRate() async {
    final data = await _health.getHealthDataFromTypes(
      types: [HealthDataType.HEART_RATE],
      startTime: _yesterday,
      endTime: _now,
    );

    if (data.isEmpty) return null;

    data.sort((a, b) => b.dateTo.compareTo(a.dateTo));

    return _getNumericValue(data.first);
  }

  Future<double> getTodayCalories() async {
    final data = await _health.getHealthDataFromTypes(
      types: [HealthDataType.ACTIVE_ENERGY_BURNED],
      startTime: _startOfToday,
      endTime: _now,
    );

    double totalCalories = 0;

    for (final point in data) {
      totalCalories += _getNumericValue(point) ?? 0;
    }

    return totalCalories;
  }

  Future<Duration> getTodaySleep() async {
    final data = await _health.getHealthDataFromTypes(
      types: [HealthDataType.SLEEP_ASLEEP],
      startTime: _startOfToday,
      endTime: _now,
    );

    Duration totalSleep = Duration.zero;

    for (final point in data) {
      totalSleep += point.dateTo.difference(point.dateFrom);
    }

    return totalSleep;
  }

  double? _getNumericValue(HealthDataPoint point) {
    final value = point.value;

    if (value is NumericHealthValue) {
      return value.numericValue.toDouble();
    }

    return null;
  }
}