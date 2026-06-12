import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_spacing.dart';
import 'package:wellnest/widgets/day_week_month_selector.dart';
import 'package:wellnest/widgets/family_selector.dart';
import 'package:wellnest/widgets/history_list.dart';
import 'package:wellnest/widgets/insight_card.dart';
import 'package:wellnest/widgets/health_detail/main_detail_card.dart';
import 'package:wellnest/widgets/sub_detail_card.dart';
import 'package:wellnest/widgets/trend_card.dart';

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
            const MainDetailCard(),
            const SizedBox(height: 24),

            // Distance and Avg Speed Split Row
            const Row(
              children: [
                Expanded(
                  child: SubDetailCard(
                    icon: Icons.location_on_outlined,
                    label: 'Distance',
                    value: '5.4',
                    unit: 'km',
                  ),
                ),
                SizedBox(width: WellnestSpacing.sm),
                Expanded(
                  child: SubDetailCard(
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
            const TrendCard(),
            const SizedBox(height: 24),

            // Wellnest Insight Card
            const InsightCard(),
            const SizedBox(height: 24),

            HistoryList(),
            const SizedBox(height: WellnestSpacing.lg),
          ],
        ),
      ),
    );
  }
}