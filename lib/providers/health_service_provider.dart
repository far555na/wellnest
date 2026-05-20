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

final todayStepsProvider = FutureProvider<int>((ref) async {
  final service = ref.read(healthServiceProvider);

  final granted = await ref.watch(healthPermissionProvider.future);

  if (!granted) {
    return 0;
  }

  return service.getTodaySteps();
});

final healthDataProvider = FutureProvider<List<HealthDataPoint>>((ref) async {
  final service = ref.read(healthServiceProvider);

  final granted = await ref.watch(healthPermissionProvider.future);

  if (!granted) {
    return [];
  }

  return service.getHealthData();
});

final latestHeartRateProvider = FutureProvider<double?>((ref) async {
  final service = ref.read(healthServiceProvider);

  final granted = await ref.watch(healthPermissionProvider.future);

  if (!granted) {
    return null;
  }

  return service.getLatestHeartRate();
});