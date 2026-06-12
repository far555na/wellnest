import 'package:health/health.dart';
import 'package:wellnest/services/health_service.dart';

class ActivityService extends HealthService {
  final List<HealthDataType> types = const [
    HealthDataType.STEPS,
  ];

  Future<bool> initStepService() async {
    return initHealth(types);
  }

  Future<int> getTodaySteps() async {
    final steps = await health.getTotalStepsInInterval(
      startOfToday,
      now,
    );

    return steps ?? 0;
  }
}