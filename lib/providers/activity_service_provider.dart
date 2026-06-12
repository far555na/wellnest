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
  final activityService = ref.read(activityServiceProvider);

  return activityService.getDatesWithStepData(month: month);
});

final todayStepsProvider = FutureProvider<int>((ref) {
  return _withActivityPermission<int>(
    ref,
    fallback: 0,
    action: (service) => service.getTodaySteps(),
  );
});

final todayHourlyStepsProvider = FutureProvider<List<double>>((ref) async {
  final service = ref.watch(activityServiceProvider);
  return service.getTodayHourlySteps();
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
