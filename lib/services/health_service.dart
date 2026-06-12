import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';

class HealthService {
  final Health health = Health();

  DateTime get now => DateTime.now();

  DateTime get startOfToday {
    final current = now;
    return DateTime(current.year, current.month, current.day);
  }

  DateTime get yesterday {
    return now.subtract(const Duration(days: 1));
  }

  List<HealthDataAccess> getReadPermissions(List<HealthDataType> types) {
    return types.map((_) => HealthDataAccess.READ).toList();
  }

  Future<bool> initHealth(List<HealthDataType> types) async {
    await Permission.activityRecognition.request();

    await health.configure();

    final granted = await health.requestAuthorization(
      types,
      permissions: getReadPermissions(types),
    );

    return granted;
  }

  double? getNumericValue(HealthDataPoint point) {
    final value = point.value;

    if (value is NumericHealthValue) {
      return value.numericValue.toDouble();
    }

    return null;
  }
}