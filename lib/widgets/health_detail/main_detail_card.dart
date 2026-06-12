import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';

class MainDetailCard extends StatelessWidget {
  const MainDetailCard({
    super.key,
    required this.steps,
    this.isLoading = false,
  });

  final int steps;
  final bool isLoading;

  static const int stepGoal = 10000;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final progress = (steps / stepGoal).clamp(0.0, 1.0);
    final percent = (progress * 100).round();

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: WellnestColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: WellnestShadows.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Total Steps',
            style: textTheme.labelMedium?.copyWith(
              color: WellnestColors.onSurface,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                isLoading ? '...' : steps.toString(),
                style: textTheme.displayLarge?.copyWith(
                  color: WellnestColors.activity,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'steps',
                style: textTheme.bodyLarge?.copyWith(
                  color: WellnestColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '$steps / $stepGoal steps',
                style: textTheme.labelSmall?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
              Text(
                '$percent%',
                style: textTheme.labelSmall?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(9999),
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 16,
              backgroundColor: WellnestColors.surfaceContainerHighest,
              valueColor: const AlwaysStoppedAnimation<Color>(
                WellnestColors.activity,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
