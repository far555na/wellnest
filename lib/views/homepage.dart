import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wellnest/providers/health_service_provider.dart';
import 'package:wellnest/widgets/health_stat_card.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    final stepsAsync = ref.watch(todayStepsProvider);
    final heartRateAsync = ref.watch(latestHeartRateProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              stepsAsync.when(
                data: (steps) {
                  return HealthStatCard(
                    label: 'STEPS',
                    value: steps.toString(),
                    unit: 'steps',
                    icon: Symbols.footprint,
                    trend: "+12%",
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                error: (error, stackTrace) {
                  return Text('Error: $error');
                },
              ),
              heartRateAsync.when(
                data: (heartRate) {
                  return HealthStatCard(
                    label: 'HEART RATE',
                    value: heartRate?.toStringAsFixed(0) ?? '--',
                    unit: 'bpm',
                    icon: Icons.favorite,
                    iconColor: theme.colorScheme.error,
                    trendColor: theme.colorScheme.onSurfaceVariant,
                    trend: 'Avg',
                  );
                },
                loading: () {
                  return const Center(child: CircularProgressIndicator());
                },
                error: (error, stackTrace) {
                  return Text('Error: $error');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
