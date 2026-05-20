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
  final data = await service.getHealthData();

  print('Health data count: ${data.length}');

  for (final point in data) {
    print('----------------------');
    print('Type: ${point.type}');
    print('Value: ${point.value}');
    print('Unit: ${point.unit}');
    print('Date From: ${point.dateFrom}');
    print('Date To: ${point.dateTo}');
    print('Source: ${point.sourceName}');
  }

  return service.getHealthData();
});