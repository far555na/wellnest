import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:android_intent_plus/android_intent.dart';
import 'dart:io';
import 'package:wellnest/providers/health_service_provider.dart';
import 'package:wellnest/widgets/profile_info_card.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final permissionAsync = ref.watch(healthPermissionProvider);

    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "PERSONAL PROFILE",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(height: 16),

        Column(
  children: [
    Row(
      children: [
        Expanded(child: ProfileInfoCard(label: "Gender", value: "Female", icon: Icons.person_outline)),
        const SizedBox(width: 16),
        Expanded(child: ProfileInfoCard(label: "Age", value: "21", icon: Icons.cake_outlined)),
      ],
    ),
    const SizedBox(height: 16),
    Row(
      children: [
        Expanded(child: ProfileInfoCard(label: "Height", value: "165 cm", icon: Icons.straighten)),
        const SizedBox(width: 16),
        Expanded(child: ProfileInfoCard(label: "Weight", value: "52 kg", icon: Icons.monitor_weight_outlined)),
      ],
    ),
  ],
),

              SizedBox(height: 48),

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

                                  permissionAsync.when(
                                    data: (granted) {
                                      if (granted) {
                                        return Text(
                                          "connected",
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelSmall!
                                              .copyWith(
                                                color: Theme.of(
                                                  context,
                                                ).colorScheme.primary,
                                              ),
                                        );
                                      }

                                      return Text(
                                        "disconnected",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.error,
                                            ),
                                      );
                                    },
                                    loading: () {
                                      return Text(
                                        "loading...",
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelSmall!
                                            .copyWith(
                                              color: Theme.of(
                                                context,
                                              ).colorScheme.outline,
                                            ),
                                      );
                                    },
                                    error: (error, stackTrace) {
                                      return Text('Error: $error');
                                    },
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
                              onPressed: () async {
                                if (!Platform.isAndroid) return;

                                try {
                                  // Android 14+ Health Connect permission management
                                  const managePermissionIntent = AndroidIntent(
                                    action:
                                        'android.health.connect.action.MANAGE_HEALTH_PERMISSIONS',
                                    arguments: {
                                      'android.intent.extra.PACKAGE_NAME':
                                          'com.example.wellnest',
                                    },
                                  );

                                  await managePermissionIntent.launch();
                                } on PlatformException {
                                  try {
                                    // Android 13 and lower Health Connect app/settings
                                    const healthConnectSettingsIntent = AndroidIntent(
                                      action:
                                          'androidx.health.ACTION_HEALTH_CONNECT_SETTINGS',
                                      package:
                                          'com.google.android.apps.healthdata',
                                    );

                                    await healthConnectSettingsIntent.launch();
                                  } on PlatformException {
                                    // Normal Android app settings fallback
                                    const appSettingsIntent = AndroidIntent(
                                      action:
                                          'android.settings.APPLICATION_DETAILS_SETTINGS',
                                      data: 'package:com.example.wellnest',
                                    );

                                    await appSettingsIntent.launch();
                                  }
                                }
                              },

                              style: FilledButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                              ),
                              child: const Text('Manage Permissions'),
                            ),
                          ),
                          // SizedBox(height: 12),
                          // SizedBox(
                          //   width: double.infinity,
                          //   child: FilledButton(
                          //     onPressed: () {},
                          //     style: FilledButton.styleFrom(
                          //       backgroundColor: Theme.of(context)
                          //           .colorScheme
                          //           .primaryContainer
                          //           .withValues(alpha: 0.2),
                          //       foregroundColor: Theme.of(
                          //         context,
                          //       ).colorScheme.primary,
                          //       padding: const EdgeInsets.symmetric(
                          //         vertical: 12,
                          //       ),
                          //     ),
                          //     child: const Text('Sync Now'),
                          //   ),
                          // ),
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
