import 'package:dukahub/src/customer/home/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'src/theme/app_theme.dart';
import 'src/onboarding/onboarding_screen.dart';
import 'src/customer/home/customer_home_screen.dart';
import 'package:flutter/services.dart';
// Import your other standalone screen files here
import 'src/customer/shop/shop_screen.dart';
import 'src/customer/records/records_screen.dart';
import 'src/customer/chats/chats_screen.dart';
import 'src/customer/profile/profile_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Force the system navigation overlay to be completely transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarDividerColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark, // Keeps the gesture pill dark/visible
  ));

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
        '/notifications': (context) => const NotificationsScreen(),
        '/shop': (context) => const ShopScreen(),
        '/records': (context) => const RecordsScreen(),
        '/chats': (context) => const ChatsScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
