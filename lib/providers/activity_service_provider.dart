import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellnest/services/activity_service.dart';

final activityServiceProvider = Provider<ActivityService>((ref) {
  return ActivityService();
});

final activityPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.read(activityServiceProvider);
  return service.initActivityService();
});

Future<T> _withActivityPermission<T>(
  Ref ref, {
  required T fallback,
  required Future<T> Function(ActivityService service) action,
}) async {
  final service = ref.read(activityServiceProvider);
  final granted = await ref.watch(activityPermissionProvider.future);

  if (!granted) {
    return fallback;
  }

  return action(service);
}

final datesWithStepDataProvider =
    FutureProvider.family<Set<DateTime>, DateTime>((ref, month) async {
  return _withActivityPermission<Set<DateTime>>(
    ref,
    fallback: <DateTime>{},
    action: (service) => service.getDatesWithStepData(month: month),
  );
});

// -------------------------
// Date-based providers
// -------------------------

final stepsProvider = FutureProvider.family<int, DateTime>((ref, date) {
  return _withActivityPermission<int>(
    ref,
    fallback: 0,
    action: (service) => service.getStepsByDate(date),
  );
});

final hourlyStepsProvider =
    FutureProvider.family<List<double>, DateTime>((ref, date) {
  return _withActivityPermission<List<double>>(
    ref,
    fallback: List<double>.filled(24, 0),
    action: (service) => service.getHourlyStepsByDate(date),
  );
});

final distanceProvider = FutureProvider.family<double, DateTime>((ref, date) {
  return _withActivityPermission<double>(
    ref,
    fallback: 0,
    action: (service) => service.getDistanceKmByDate(date),
  );
});

final averageSpeedProvider =
    FutureProvider.family<double, DateTime>((ref, date) {
  return _withActivityPermission<double>(
    ref,
    fallback: 0,
    action: (service) => service.getAverageSpeedKmhByDate(date),
  );
});

// -------------------------
// Optional old today providers
// Keep these if other pages still use them
// -------------------------

final todayStepsProvider = FutureProvider<int>((ref) {
  return _withActivityPermission<int>(
    ref,
    fallback: 0,
    action: (service) => service.getTodaySteps(),
  );
});

final todayHourlyStepsProvider = FutureProvider<List<double>>((ref) {
  return _withActivityPermission<List<double>>(
    ref,
    fallback: List<double>.filled(24, 0),
    action: (service) => service.getTodayHourlySteps(),
  );
});

final todayDistanceProvider = FutureProvider<double>((ref) {
  return _withActivityPermission<double>(
    ref,
    fallback: 0,
    action: (service) => service.getTodayDistanceKm(),
  );
});

final todayAverageSpeedProvider = FutureProvider<double>((ref) {
  return _withActivityPermission<double>(
    ref,
    fallback: 0,
    action: (service) => service.getTodayAverageSpeedKmh(),
  );
});