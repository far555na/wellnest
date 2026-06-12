import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:wellnest/providers/selected_date_provider.dart';
import 'package:wellnest/theme/wellnest_color.dart';

class DatePickerTitle extends ConsumerWidget {
  const DatePickerTitle({super.key});

Future<void> _pickDate(BuildContext context, WidgetRef ref) async {
  final selectedDate = ref.read(selectedDateProvider);

  // Example dates that have data
  final datesWithData = <DateTime>{
    DateTime(2026, 6, 10),
    DateTime(2026, 6, 11),
    DateTime(2026, 6, 12),
  };

  bool hasData(DateTime day) {
    return datesWithData.any(
      (date) =>
          date.year == day.year &&
          date.month == day.month &&
          date.day == day.day,
    );
  }

  final pickedDate = await showDialog<DateTime>(
    context: context,
    builder: (context) {
      DateTime tempSelectedDate = selectedDate;
      DateTime focusedDay = selectedDate;

      return AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        contentPadding: const EdgeInsets.all(16),
        content: StatefulBuilder(
          builder: (context, setState) {
            return SizedBox(
              width: double.maxFinite,
              child: TableCalendar(
                firstDay: DateTime(2020),
                lastDay: DateTime.now(),
                focusedDay: focusedDay,
                selectedDayPredicate: (day) {
                  return isSameDay(tempSelectedDate, day);
                },
                onDaySelected: (selectedDay, newFocusedDay) {
                  setState(() {
                    tempSelectedDate = selectedDay;
                    focusedDay = newFocusedDay;
                  });

                  Navigator.pop(context, selectedDay);
                },
                calendarBuilders: CalendarBuilders(
                  markerBuilder: (context, day, events) {
                    if (!hasData(day)) return null;

                    return Positioned(
                      bottom: 6,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: BoxDecoration(
                          color: WellnestColors.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    );
                  },
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible: false,
                  titleCentered: true,
                ),
                calendarStyle: CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: WellnestColors.primary.withOpacity(0.18),
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: WellnestColors.primary,
                    shape: BoxShape.circle,
                  ),
                  selectedTextStyle: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );

  if (pickedDate != null) {
    ref.read(selectedDateProvider.notifier).setDate(pickedDate);
  }
}

  String _formatDate(DateTime date) {
    const months = [
      'Jan',
      'Feb',
      'Mar',
      'Apr',
      'May',
      'Jun',
      'Jul',
      'Aug',
      'Sep',
      'Oct',
      'Nov',
      'Dec',
    ];

    final month = months[date.month - 1];

    final formatted = '$month ${date.day}, ${date.year}';

    return formatted;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textTheme = Theme.of(context).textTheme;
    final selectedDate = ref.watch(selectedDateProvider);

    return Center(
      child: InkWell(
        onTap: () => _pickDate(context, ref),
        borderRadius: BorderRadius.circular(999),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _formatDate(selectedDate),
                style: textTheme.labelMedium?.copyWith(
                  color: WellnestColors.onSurfaceVariant,
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 20,
                color: WellnestColors.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
