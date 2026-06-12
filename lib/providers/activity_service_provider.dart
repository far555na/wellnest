import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellnest/services/activity_service.dart';

final activityServiceProvider = Provider<ActivityService>((ref) {
  return ActivityService();
});

final stepPermissionProvider = FutureProvider<bool>((ref) async {
  final service = ref.read(activityServiceProvider);
  return service.initStepService();
});

Future<T> _withStepPermission<T>(
  Ref ref, {
  required T fallback,
  required Future<T> Function(ActivityService service) action,
}) async {
  final service = ref.read(activityServiceProvider);
  final granted = await ref.watch(stepPermissionProvider.future);

  if (!granted) {
    return fallback;
  }

  return action(service);
}

final todayStepsProvider = FutureProvider<int>((ref) {
  return _withStepPermission<int>(
    ref,
    fallback: 0,
    action: (service) => service.getTodaySteps(),
  );
});
