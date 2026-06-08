import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';

class InsightCard extends StatelessWidget {
  const InsightCard({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: WellnestColors.activitySurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: WellnestColors.activityContainerHighest),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.lightbulb_outline,
                color: WellnestColors.activity,
                size: 20,
              ),
              const SizedBox(width: 12),
              Text(
                'Wellnest Insight',
                style: textTheme.labelMedium?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Your resting heart rate has been slightly lower this week. This is often a sign of improved cardiovascular fitness.',
            style: textTheme.bodySmall?.copyWith(
              color: WellnestColors.onSurface,
            ),
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: WellnestColors.activity,
                foregroundColor: WellnestColors.surfaceContainerLowest,
                elevation: 0,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
              onPressed: () {},
              child: Text(
                'View Suggestions',
                style: textTheme.labelMedium?.copyWith(color: WellnestColors.surfaceContainerLowest),
              ),
            ),
          ),
        ],
      ),
    );
  }
}