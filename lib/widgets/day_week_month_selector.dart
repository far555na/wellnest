import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';


class DayWeekMonthSelector extends StatefulWidget {
  const DayWeekMonthSelector({super.key});

  @override
  State<DayWeekMonthSelector> createState() => _DayWeekMonthSelectorState();
}

class _DayWeekMonthSelectorState extends State<DayWeekMonthSelector> {
  int selectedIndex = 0;

  final List<String> tabs = ['Day', 'Week', 'Month'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final colorTheme = Theme.of(context).colorScheme;

    return Container(
      // height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: WellnestColors.surfaceContainer,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Stack(
        children: [
          
          Positioned.fill(
            child: AnimatedAlign(
              duration: const Duration(milliseconds: 220),
              curve: Curves.easeOut,
              alignment: selectedIndex == 0
                  ? Alignment.centerLeft
                  : selectedIndex == 1
                  ? Alignment.center
                  : Alignment.centerRight,
              child: FractionallySizedBox(
                widthFactor: 1 / 3,
                child: Container(
                  decoration: BoxDecoration(
                    color: WellnestColors.activity,
                    borderRadius: BorderRadius.circular(9999),
                  ),
                ),
              ),
            ),
          ),

          Row(
            children: List.generate(tabs.length, (index) {
              final isSelected = selectedIndex == index;

              return Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  },
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: 8,
                      ),
                      child: Text(
                        tabs[index],
                        style: textTheme.bodySmall?.copyWith(
                          color: isSelected
                              ? WellnestColors.surfaceContainerLowest
                              : WellnestColors.onSurface,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
