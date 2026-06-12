import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';

class TrendCard extends StatelessWidget {
  const TrendCard({
    super.key,
    required this.hourlySteps,
  });

  final List<double> hourlySteps;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final maxStep = hourlySteps.isEmpty
        ? 100.0
        : hourlySteps.reduce((a, b) => a > b ? a : b);

    final chartMaxY = maxStep <= 0 ? 100.0 : maxStep * 1.2;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: WellnestColors.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(24),
        boxShadow: WellnestShadows.boxShadow,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Steps Trend',
                style: textTheme.labelMedium?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
              Text(
                'Hourly',
                style: textTheme.labelSmall?.copyWith(
                  color: WellnestColors.onSurfaceVariant,
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          SizedBox(
            height: 150,
            child: BarChart(
              BarChartData(
                minY: 0,
                maxY: chartMaxY,
                alignment: BarChartAlignment.spaceEvenly,

                barGroups: List.generate(hourlySteps.length, (index) {
                  final value = hourlySteps[index];
                  final isActive = value > 0;

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        width: 8,
                        color: isActive
                            ? WellnestColors.activity
                            : WellnestColors.surfaceContainerHighest,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(9999),
                        ),
                      ),
                    ],
                  );
                }),

                gridData: FlGridData(
                  show: true,
                  drawVerticalLine: false,
                  horizontalInterval: chartMaxY / 3,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: WellnestColors.surfaceContainer,
                      strokeWidth: 1,
                    );
                  },
                ),

                borderData: FlBorderData(show: false),

                titlesData: FlTitlesData(
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  leftTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        String text = '';

                        switch (value.toInt()) {
                          case 0:
                            text = '00:00';
                            break;
                          case 6:
                            text = '06:00';
                            break;
                          case 12:
                            text = '12:00';
                            break;
                          case 18:
                            text = '18:00';
                            break;
                          case 23:
                            text = ':23:00';
                            break;
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            text,
                            style: textTheme.labelSmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: WellnestColors.onSurface,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                barTouchData: BarTouchData(
                  enabled: true,
                  touchTooltipData: BarTouchTooltipData(
                    getTooltipItem: (group, groupIndex, rod, rodIndex) {
                      return BarTooltipItem(
                        '${rod.toY.toInt()} steps',
                        textTheme.labelSmall!.copyWith(
                          color: WellnestColors.onSurface,
                          fontWeight: FontWeight.w600,
                        ),
                      );
                    },
                  ),
                ),
              ),
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            ),
          ),
        ],
      ),
    );
  }
}