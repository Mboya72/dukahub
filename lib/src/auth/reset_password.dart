import 'package:flutter/material.dart';
import '../theme/app_theme.dart'; // Points directly to your single theme file workspace

// =========================================================================
// Step 1: Request Reset Screen (Matches layout reference: reset password1.png)
// =========================================================================
class RequestResetScreen extends StatelessWidget {
  const RequestResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Reset\nPassword',
                // Uses the massive custom local variable typography mapping
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 80),

              AppTheme.buildLabel('Email / Phone Number'),
              const TextField(
                decoration: InputDecoration(hintText: 'Email / Phone Number'),
              ),

              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  // Navigate to next step: VerifyCodeScreen
                },
                child: const Text('Send Code'),
              ),

              const Spacer(),
              AppTheme.buildBottomSwitch(
                "Remember your password?",
                "Login",
                    () {
                  // Return to login screen
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

// =========================================================================
// Step 2: Verify Code OTP Screen (Matches layout reference: reset password2.png)
// =========================================================================
class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Enter\nCode',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 80),

              AppTheme.buildLabel('Code'),
              const TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(hintText: 'Code'),
              ),

              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  // Navigate to next step: SetNewPasswordScreen
                },
                child: const Text('Verify Code'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// =========================================================================
// Step 3: Set New Password Screen (Matches layout reference: reset password3.png)
// =========================================================================
class SetNewPasswordScreen extends StatelessWidget {
  const SetNewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Change\nPassword',
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(height: 60),

              AppTheme.buildLabel('Change Password'),
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

              const SizedBox(height: 60),
              ElevatedButton(
                onPressed: () {
                  // Execute password update action
                },
                child: const Text('Change Password'),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}