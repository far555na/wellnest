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
    final caloriesAsync = ref.watch(todayCaloriesProvider);
    final sleepAsync = ref.watch(todaySleepProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              Row(
                spacing: 16,
                children: [
                  Expanded(
                    child: stepsAsync.when(
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
                  ),
                  Expanded(
                    child: sleepAsync.when(
                      data: (sleep) {
                        return HealthStatCard(
                          label: 'SLEEP',
                          value: formatSleep(sleep),
                          icon: Icons.nightlight,
                          iconColor: theme.colorScheme.secondary,
                          trend: '-5%',
                          trendColor: theme.colorScheme.error,
                        );
                      },
                      loading: () {
                        return const Center(child: CircularProgressIndicator());
                      },
                      error: (error, stackTrace) {
                        return Text('Error: $error');
                      },
                    ),
                  ),
                ],
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
              caloriesAsync.when(
                data: (calories) {
                  return HealthStatCard(
                    label: 'CALORIES',
                    value: calories.toStringAsFixed(0),
                    unit: 'kcal',
                    icon: Icons.local_fire_department,
                    iconColor: theme.colorScheme.tertiary,
                    trend: 'On Track',
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

String formatSleep(Duration duration) {
  final hours = duration.inHours;
  final minutes = duration.inMinutes.remainder(60);

  return '${hours}h ${minutes}m';
}
