import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellnest/services/health_service.dart';

final healthServiceProvider = Provider<HealthService>((ref) {
  return HealthService();
});