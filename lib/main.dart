import 'package:dukahub/src/onboarding/onboarding_screen.dart';
import 'package:dukahub/src/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Premium Management Ecosystem',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: const OnboardingScreen(), // Launches the newly configured variable font slides first
    );
  }
}