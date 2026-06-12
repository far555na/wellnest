import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellnest/providers/activity_service_provider.dart';
import 'package:wellnest/providers/selected_date_provider.dart';
import 'package:wellnest/theme/wellnest_color.dart';
import 'package:wellnest/theme/wellnest_spacing.dart';
import 'package:wellnest/widgets/day_week_month_selector.dart';
import 'package:wellnest/widgets/family_selector.dart';
import 'package:wellnest/widgets/health_detail/date_picker_title.dart';
import 'package:wellnest/widgets/history_list.dart';
import 'package:wellnest/widgets/insight_card.dart';
import 'package:wellnest/widgets/health_detail/main_detail_card.dart';
import 'package:wellnest/widgets/health_detail/sub_detail_card.dart';
import 'package:wellnest/widgets/health_detail/trend_card.dart';

class StepsPage extends ConsumerWidget {
  const StepsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    
    final selectedDate = ref.watch(selectedDateProvider);

    final stepsAsync = ref.watch(stepsProvider(selectedDate));
    final distanceAsync = ref.watch(distanceProvider(selectedDate));
    final avgSpeedAsync = ref.watch(averageSpeedProvider(selectedDate));
    final hourlyStepsAsync = ref.watch(hourlyStepsProvider(selectedDate));

    final stepsValue = stepsAsync.when(
      data: (steps) => steps,
      loading: () => 0,
      error: (_, __) => 0,
    );

    final isStepsLoading = stepsAsync.isLoading;

    final distanceValue = distanceAsync.when(
      data: (distance) => distance.toStringAsFixed(1),
      loading: () => '--',
      error: (_, __) => '0.0',
    );

    final avgSpeedValue = avgSpeedAsync.when(
      data: (speed) => speed.toStringAsFixed(1),
      loading: () => '--',
      error: (_, __) => '0.0',
    );

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
            Center(child: const DatePickerTitle()),
            const SizedBox(height: WellnestSpacing.sm),

            // Time filter Segmented Control
            const DayWeekMonthSelector(),
            const SizedBox(height: WellnestSpacing.sm),

            // Family Avatar Selector
            const FamilySelector(),
            const SizedBox(height: 24),

            // Total Steps Summary Card
            MainDetailCard(steps: stepsValue, isLoading: isStepsLoading),
            const SizedBox(height: 24),

            // Distance and Avg Speed Split Row
            Row(
              children: [
                Expanded(
                  child: SubDetailCard(
                    icon: Icons.location_on_outlined,
                    label: 'Distance',
                    value: distanceValue,
                    unit: 'km',
                  ),
                ),
                const SizedBox(width: WellnestSpacing.sm),
                Expanded(
                  child: SubDetailCard(
                    icon: Icons.speed_outlined,
                    label: 'Avg Speed',
                    value: avgSpeedValue,
                    unit: 'km/h',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Steps Trend Chart Card
            hourlyStepsAsync.when(
              data: (hourlySteps) {
                return TrendCard(hourlySteps: hourlySteps);
              },
              loading: () {
                return const SizedBox(
                  height: 220,
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              error: (error, stackTrace) {
                return TrendCard(hourlySteps: List.filled(24, 0));
              },
            ),
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
