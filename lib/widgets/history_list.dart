import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';
import 'package:wellnest/theme/wellnest_spacing.dart';

class HistoryList extends StatelessWidget {
  const HistoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'History',
          style: textTheme.labelLarge?.copyWith(
            color: WellnestColors.onBackground,
          ),
        ),
        const SizedBox(height: 12),

        // History Rows
        const _HistoryItemRow(
          icon: Icons.calendar_today_outlined,
          title: 'Today',
          steps: '8,240',
        ),
        const SizedBox(height: 8),
        const _HistoryItemRow(
          icon: Icons.history,
          title: 'Yesterday',
          steps: '7,100',
        ),
        const SizedBox(height: 8),
        const _HistoryItemRow(
          icon: Icons.history,
          title: '2 days ago',
          steps: '9,300',
        ),
      ],
    );
  }
}

class _HistoryItemRow extends StatelessWidget {
  final IconData icon;
  final String title;
  final String steps;

  const _HistoryItemRow({
    required this.icon,
    required this.title,
    required this.steps,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: WellnestColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: WellnestShadows.boxShadow,
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(WellnestSpacing.base),
            decoration: BoxDecoration(
              color: WellnestColors.activityContainerHighest,
              borderRadius: BorderRadius.circular(9999),
            ),
            child: Icon(icon, color: WellnestColors.activity, size: 20),
          ),
          const SizedBox(width: 12),
          Text(
            title,
            style: textTheme.bodySmall?.copyWith(
              color: WellnestColors.onSurface,
            ),
          ),
          const Spacer(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                steps,
                style: textTheme.labelLarge?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'steps',
                style: textTheme.bodySmall?.copyWith(
                  color: WellnestColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
