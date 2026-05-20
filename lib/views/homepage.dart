import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';
import 'package:wellnest/widgets/health_stat_card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16,
            children: [
              HealthStatCard(
                icon: Symbols.footprint,
                label: "STEPS",
                value: "6430",
                trend: "+12%",
              ),
               HealthStatCard(
                icon: Icons.favorite,
                label: "HEART RATE",
                value: "78",
                trend: "Avg",
                unit: "bpm",
                iconColor: theme.colorScheme.error,
                trendColor: theme.colorScheme.onSurfaceVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
