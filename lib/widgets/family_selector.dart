import 'package:flutter/material.dart';
import 'package:wellnest/theme/wellnest_color.dart';

class FamilySelector extends StatefulWidget {
  const FamilySelector({super.key});

  @override
  State<FamilySelector> createState() => _FamilySelectorState();
}

class _FamilySelectorState extends State<FamilySelector> {
  int selectedIndex = 0;

  final members = [
    {'name': 'Me', 'image': 'lib/assets/images/me.jpg'},
    {'name': 'Mom', 'image': 'assets/images/mom.jpg'},
    {'name': 'Dad', 'image': 'assets/images/dad.jpg'},
    {'name': 'Sister', 'image': 'assets/images/sister.jpg'},
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.zero,
      child: Row(
        children: List.generate(members.length, (index) {
          final member = members[index];
          final isSelected = selectedIndex == index;

          return Padding(
            padding: EdgeInsets.only(
              right: index == members.length - 1 ? 0 : 8,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                curve: Curves.easeOut,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? WellnestColors.activity
                      : WellnestColors.surfaceContainer,
                  borderRadius: BorderRadius.circular(9999),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 12,
                      backgroundColor: WellnestColors.surfaceContainerHighest,
                      backgroundImage:
                          member['image'] != null && member['image']!.isNotEmpty
                          ? AssetImage(member['image']!)
                          : null,
                      child: member['image'] == null || member['image']!.isEmpty
                          ? Icon(
                              Icons.person,
                              size: 14,
                              color: WellnestColors.surfaceContainerLowest,
                            )
                          : null,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      member['name']!,
                      style: textTheme.bodySmall?.copyWith(
                        color: isSelected
                            ? WellnestColors.surfaceContainerLowest
                            : WellnestColors.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
