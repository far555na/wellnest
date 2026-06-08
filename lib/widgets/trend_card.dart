import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';

class TrendCard extends StatelessWidget {
  const TrendCard({super.key});

  final List<double> _hourlySteps = const [
    35,
    65,
    85,
    110,
    60,
    40,
    25,
    95,
    55,
    30,
  ];

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
                maxY: 120,
                alignment: BarChartAlignment.spaceEvenly,

                barGroups: List.generate(_hourlySteps.length, (index) {
                  final value = _hourlySteps[index];
                  final isActive = value >= 80;

                  return BarChartGroupData(
                    x: index,
                    barRods: [
                      BarChartRodData(
                        toY: value,
                        width: 18,
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
                  horizontalInterval: 40,
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

                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 35,
                      interval: 40,
                      getTitlesWidget: (value, meta) {
                        String text = '';

                        if (value == 40) {
                          text = 'Low';
                        } else if (value == 80) {
                          text = 'Mod';
                        } else if (value == 120) {
                          text = 'High';
                        }

                        return Text(
                          text,
                          style: textTheme.labelSmall?.copyWith(
                            fontSize: 10,
                            color: WellnestColors.outline,
                          ),
                        );
                      },
                    ),
                  ),

                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      reservedSize: 28,
                      getTitlesWidget: (value, meta) {
                        String text = '';

                        switch (value.toInt()) {
                          case 0:
                            text = '06:00';
                            break;
                          case 3:
                            text = '12:00';
                            break;
                          case 6:
                            text = '18:00';
                            break;
                          case 9:
                            text = '00:00';
                            break;
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            text,
                            style: textTheme.labelSmall?.copyWith(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: WellnestColors.onSurface,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),

                // barTouchData: BarTouchData(
                //   enabled: true,
                //   touchTooltipData: BarTouchTooltipData(
                //     tooltipRoundedRadius: WellnestRadius.sm,
                //     tooltipPadding: const EdgeInsets.symmetric(
                //       horizontal: 10,
                //       vertical: 6,
                //     ),
                //     getTooltipItem: (group, groupIndex, rod, rodIndex) {
                //       return BarTooltipItem(
                //         '${rod.toY.toInt()} steps',
                //         textTheme.labelSmall!.copyWith(
                //           color: WellnestColors.onSurface,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       );
                //     },
                //   ),
                // ),
                barTouchData: BarTouchData(enabled: true),
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