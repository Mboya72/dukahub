import 'package:flutter/material.dart';
import '../theme/app_theme.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  final String selectedRole; // Receives data passed from the onboarding popup selection

  const SignUpScreen({
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
              const SizedBox(height: 40),
              Text(
                'Sign Up',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 6),
              // Premium sub-heading dynamically telling the user what account they are forming
              Text(
                'Creating your $selectedRole portal account.',
                style: TextStyle(
                  color: AppTheme.primaryDark.withValues(alpha: 0.6),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 34),

              AppTheme.buildLabel('First and Last name'),
              const TextField(
                decoration: InputDecoration(hintText: 'First and Last name'),
              ),

              const SizedBox(height: 20),
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

              const SizedBox(height: 20),
              AppTheme.buildLabel('Confirm Password'),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(hintText: 'Confirm Password'),
              ),

              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  // Execute onboarding registration pipeline
                  debugPrint('Registering user data package containing role: $selectedRole');
                },
                child: const Text('Sign Up'),
              ),

              const SizedBox(height: 30),
              Row(
                children: [
                  const Expanded(child: Divider(color: AppTheme.borderColor)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      'Or sign up with',
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

              const SizedBox(height: 30),
              AppTheme.buildBottomSwitch(
                "You have an Account?",
                "Login",
                    () {
                      Navigator.pop(context); // Clars the active sheet container modal view overlay canvas
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const LoginScreen(selectedRole: '',)),
                      ); // Clears registration flow frame stack cleanly
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