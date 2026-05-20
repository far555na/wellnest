import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:health/health.dart';
import 'package:wellnest/services/health_service.dart';

final healthServiceProvider = Provider<HealthService>((ref) {
  return HealthService();
});

final healthPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.read(healthServiceProvider);
  return service.initHealth();
});

Future<T> _withHealthPermission<T>(
  Ref ref, {
  required T fallback,
  required Future<T> Function(HealthService service) action,
}) async {
  final service = ref.read(healthServiceProvider);
  final granted = await ref.watch(healthPermissionProvider.future);

  if (!granted) {
    return fallback;
  }

  return action(service);
}

final todayStepsProvider = FutureProvider<int>((ref) {
  return _withHealthPermission<int>(
    ref,
    fallback: 0,
    action: (service) => service.getTodaySteps(),
  );
});

final healthDataProvider = FutureProvider<List<HealthDataPoint>>((ref) {
  return _withHealthPermission<List<HealthDataPoint>>(
    ref,
    fallback: [],
    action: (service) => service.getHealthData(),
  );
});

final latestHeartRateProvider = FutureProvider<double?>((ref) {
  return _withHealthPermission<double?>(
    ref,
    fallback: null,
    action: (service) => service.getLatestHeartRate(),
  );
});

final todayCaloriesProvider = FutureProvider<double>((ref) {
  return _withHealthPermission<double>(
    ref,
    fallback: 0,
    action: (service) => service.getTodayCalories(),
  );
});

final todaySleepProvider = FutureProvider<Duration>((ref) {
  return _withHealthPermission<Duration>(
    ref,
    fallback: Duration.zero,
    action: (service) => service.getTodaySleep(),
  );
});