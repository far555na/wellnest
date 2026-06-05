import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_radius.dart';
import 'package:wellnest/theme/wellnest_shadows.dart';
import 'package:wellnest/theme/wellnest_spacing.dart';
import 'package:wellnest/widgets/day_week_month_selector.dart';
import 'package:wellnest/widgets/family_selector.dart';
import 'package:fl_chart/fl_chart.dart';

class StepsPage extends StatelessWidget {
  const StepsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: WellnestColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: WellnestColors.onSurface),
          onPressed: () => Navigator.maybePop(context),
        ),
        title: Text(
          'Steps',
          style: textTheme.titleLarge?.copyWith(
            color: WellnestColors.onSurface,
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Icon(Icons.directions_run, color: WellnestColors.activity),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: WellnestSpacing.marginMobile,
          vertical: WellnestSpacing.base,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Today, May 29',
                style: textTheme.labelMedium?.copyWith(
                  color: WellnestColors.onSurface,
                ),
              ),
            ),
            const SizedBox(height: WellnestSpacing.sm),

            // Time filter Segmented Control
            const DayWeekMonthSelector(),
            const SizedBox(height: WellnestSpacing.sm),

            // Family Avatar Selector
            const FamilySelector(),
            const SizedBox(height: 24),

            // Total Steps Summary Card
            const _TotalStepsCard(),
            const SizedBox(height: 24),

            // Distance and Avg Speed Split Row
            const Row(
              children: [
                Expanded(
                  child: _MetricsMetricCard(
                    icon: Icons.location_on_outlined,
                    label: 'Distance',
                    value: '5.4',
                    unit: 'km',
                  ),
                ),
                SizedBox(width: WellnestSpacing.sm),
                Expanded(
                  child: _MetricsMetricCard(
                    icon: Icons.speed_outlined,
                    label: 'Avg Speed',
                    value: '4.8',
                    unit: 'km/h',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Steps Trend Chart Card
            const _StepsTrendCard(),
            const SizedBox(height: 24),

            // Wellnest Insight Card
            const _WellnestInsightCard(),
            const SizedBox(height: 24),

            // History List Header
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
            const SizedBox(height: WellnestSpacing.lg),
          ],
        ),
      ),
    );
  }
}

/// 3. Large Top Card Displaying Progress to Steps Goal
class _TotalStepsCard extends StatelessWidget {
  const _TotalStepsCard();

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

/// 4. Modular Split Metric Layouts (Distance & Speed)
class _MetricsMetricCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final String unit;

  const _MetricsMetricCard({
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

class _StepsTrendCard extends StatelessWidget {
  const _StepsTrendCard();

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

/// 6. Actionable Light Red Insight banner Card
class _WellnestInsightCard extends StatelessWidget {
  const _WellnestInsightCard();

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
                  borderRadius: BorderRadius.circular(WellnestRadius.full),
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

/// 7. List item component for previous day track history logs
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
