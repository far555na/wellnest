import 'package:flutter/material.dart';

class HealthStatCard extends StatelessWidget {
  const HealthStatCard({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
    required this.trend,
    this.unit,
    this.iconColor,
    this.trendColor,
  });

  final IconData icon;
  final String label;
  final String value;
  final String trend;
  final String? unit;
  final Color? iconColor;
  final Color? trendColor;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(24),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 4,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 21, color: iconColor ?? theme.colorScheme.primary),
              Text(
                trend,
                style: theme.textTheme.labelSmall!.copyWith(
                  color: trendColor ?? theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 12),
            child: Text(label, style: theme.textTheme.labelMedium),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            spacing: 6,
            children: [
              Text(value, style: theme.textTheme.headlineSmall),
              if (unit != null) Text(unit!, style: theme.textTheme.labelSmall),
            ],
          ),
        ],
      ),
    );
  }
}
