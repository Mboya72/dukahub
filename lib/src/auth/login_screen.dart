import 'dart:ui';
import 'package:flutter/material.dart';
import 'signup_screen.dart';
import '../customer/home/customer_home_screen.dart';
import '../theme/app_theme.dart'; // Points directly to your single theme file workspace

class LoginScreen extends StatelessWidget {
  final String selectedRole; // Receives account type context configuration passed from the onboarding step

  const LoginScreen({
    super.key,
    required this.selectedRole,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Login',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 6),
              // Dynamic subtitle confirming the active secure portal context
              Text(
                'Accessing your $selectedRole portal workspace.',
                style: TextStyle(
                  color: AppTheme.primaryDark.withValues(alpha: 0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 54),

              AppTheme.buildLabel('Email / Phone Number'),
              const TextField(
                decoration: InputDecoration(hintText: 'Email / Phone Number'),
              ),

              const SizedBox(height: 20),
              AppTheme.buildLabel('Password'),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Password'),
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    // Route execution landing steps out to RequestResetScreen()
                  },
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: AppTheme.accentYellow,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // 1. Execute your merchant or consumer authentication validation pipeline
                  debugPrint('Authenticating credential block under role: $selectedRole');

                  // 2. Clear the route history stack and land directly into the customer dashboard
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context) => const CustomerHomeScreen(),
                    ),
                        (route) => false, // Passing false ensures the user cannot hit 'Back' to return to the login inputs
                  );
                },
                child: const Text('Login'),
              ),

              const SizedBox(height: 40),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppTheme.borderColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or Login with',
                      style: TextStyle(
                        color: AppTheme.primaryDark.withValues(alpha: 0.7),
                        fontSize: 14,
                      ),
                    ),
                  ),
                  const Expanded(child: Divider(color: AppTheme.borderColor)),
                ],
              ),

              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryDark,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.apple, color: Colors.white, size: 24),
                          SizedBox(width: 8),
                          Text(
                            'Apple',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      height: 56,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryDark,
                        borderRadius: BorderRadius.circular(28),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.g_mobiledata, color: Colors.white, size: 32),
                          SizedBox(width: 4),
                          Text(
                            'Google',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),
              AppTheme.buildBottomSwitch(
                "You don't have an Account?",
                "Sign Up",
                    () {
                  // Open the sheet directly on top of the LoginScreen
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (modalContext) {
                      return BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(32),
                              topRight: Radius.circular(32),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Center(
                                child: Container(
                                  width: 48,
                                  height: 5,
                                  decoration: BoxDecoration(
                                    color: AppTheme.primaryDark.withValues(alpha: 0.2),
                                    borderRadius: BorderRadius.circular(2.5),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 32),
                              const Text(
                                'Choose Your Account Type',
                                style: TextStyle(
                                  color: AppTheme.primaryDark,
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'Select how you intend to use DukaHub to continue.',
                                style: TextStyle(color: AppTheme.primaryDark, fontSize: 15),
                              ),
                              const SizedBox(height: 28),

                              // Shopkeeper Profile Mode Card Item
                              InkWell(
                                onTap: () {
                                  Navigator.pop(modalContext);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpScreen(selectedRole: 'Shopkeeper'),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 52,
                                        height: 52,
                                        decoration: BoxDecoration(
                                          color: AppTheme.accentYellow.withValues(alpha: 0.15),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.storefront_rounded, color: AppTheme.accentYellow, size: 26),
                                      ),
                                      const SizedBox(width: 16),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'I am a Shopkeeper',
                                              style: TextStyle(color: AppTheme.primaryDark, fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Manage debts (Daftari), track stock, and send automated client reminders.',
                                              style: TextStyle(color: AppTheme.hintColor, fontSize: 13, height: 1.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.chevron_right_rounded, color: AppTheme.hintColor),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 16),

                              // Customer Profile Mode Card Item
                              InkWell(
                                onTap: () {
                                  Navigator.pop(modalContext);
                                  Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                      builder: (context) => const SignUpScreen(selectedRole: 'Customer'),
                                    ),
                                  );
                                },
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: const Color(0xFFE2E8F0), width: 1.5),
                                  ),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 52,
                                        height: 52,
                                        decoration: BoxDecoration(
                                          color: AppTheme.primaryDark.withValues(alpha: 0.15),
                                          shape: BoxShape.circle,
                                        ),
                                        child: const Icon(Icons.shopping_bag_rounded, color: AppTheme.primaryDark, size: 26),
                                      ),
                                      const SizedBox(width: 16),
                                      const Expanded(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'I am a Customer',
                                              style: TextStyle(color: AppTheme.primaryDark, fontSize: 18, fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(height: 4),
                                            Text(
                                              'Track your personal store credits, orders, and view local inventory layouts.',
                                              style: TextStyle(color: AppTheme.hintColor, fontSize: 13, height: 1.3),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Icon(Icons.chevron_right_rounded, color: AppTheme.hintColor),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(height: 12),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}