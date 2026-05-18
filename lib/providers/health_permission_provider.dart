import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'health_service_provider.dart';

final healthPermissionProvider = FutureProvider<bool>((ref) async {
  final healthService = ref.read(healthServiceProvider);
  return healthService.initHealth();
});