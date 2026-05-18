import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "CONNECTION",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 16),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimary,
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Padding(
                  padding: EdgeInsetsGeometry.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withValues(alpha: 0.2),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.hub_outlined,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.primary,
                                    size: 24,
                                  ),
                                ),
                              ),

                              SizedBox(width: 12),

                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Health Connect",
                                    style: Theme.of(
                                      context,
                                    ).textTheme.labelMedium,
                                  ),
                                  Text(
                                    "connected",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall!
                                        .copyWith(
                                          color: Theme.of(
                                            context,
                                          ).colorScheme.primary,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Icon(
                            Icons.verified_outlined,
                            color: Theme.of(context).colorScheme.outline,
                            size: 22,
                          ),
                        ],
                      ),

                      SizedBox(height: 24),

                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text('Manage Permissions'),
                            ),
                          ),
                          SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: FilledButton(
                              onPressed: () {},
                              style: FilledButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer
                                      .withValues(alpha: 0.2),
                                foregroundColor: Theme.of(context).colorScheme.primary,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text('Sync Now'),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
