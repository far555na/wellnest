import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:wellnest/theme/wellnest_theme.dart';
import 'package:wellnest/services/health_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:wellnest/views/dashboard_page.dart';
import 'package:wellnest/views/steps_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wellnest',
      debugShowCheckedModeBanner: false,
      theme: WellnestTheme.lightTheme,
      home: StepsPage(),
    );
  }
}