import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';

class MainDetailCard extends StatelessWidget {
  const MainDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
                '8,240',
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
                '8,240 / 10,000 steps',
                style: textTheme.labelSmall?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
              Text(
                '82%',
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
              value: 0.82,
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
