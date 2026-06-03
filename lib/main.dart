import 'package:flutter/material.dart';
import 'src/theme/app_theme.dart';
import 'src/onboarding/onboarding_screen.dart';
import 'src/customer/home/customer_home_screen.dart';
// Import your other standalone screen files here
import 'src/customer/shop/shop_screen.dart';
import 'src/customer/records/records_screen.dart';
import 'src/customer/chats/chats_screen.dart';
import 'src/customer/profile/profile_screen.dart';

void main() {
  runApp(const DukaHubApp());
}

class DukaHubApp extends StatelessWidget {
  const DukaHubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DukaHub',
      theme: AppTheme.lightTheme,
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => const OnboardingScreen(),
        '/customer-home': (context) => const CustomerHomeScreen(),
        '/shop': (context) => const ShopScreen(),
        '/records': (context) => const RecordsScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
