import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';

class SubDetailCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;

  const SubDetailCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.unit,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: WellnestColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: WellnestShadows.boxShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: WellnestColors.activity, size: 20),
          const SizedBox(height: 4),
          Text(
            label,
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
                value,
                style: textTheme.headlineLarge?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                unit,
                style: textTheme.bodyMedium?.copyWith(
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