import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellnest/providers/health_service_provider.dart';
import 'package:wellnest/widgets/health_stat_card.dart';

class Homepage extends ConsumerWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ThemeData theme = Theme.of(context);
    final stepsAsync = ref.watch(todayStepsProvider);

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
                    icon: Icons.directions_walk,
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
              HealthStatCard(
                icon: Icons.favorite,
                label: "HEART RATE",
                value: "78",
                trend: "Avg",
                unit: "bpm",
                iconColor: theme.colorScheme.error,
                trendColor: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
