import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_themes.dart';

// =========================================================================
// Step 1: Request Reset Screen (Matches layout reference: reset password1.png)
// =========================================================================
class RequestResetScreen extends StatelessWidget {
  const RequestResetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Reset\nPassword',
                style: GoogleFonts.urbanist(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryDark,
                  height: 1.1,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 80),

              buildLabel('Email / Phone Number'),
              TextField(decoration: customInputDecoration('Email / Phone Number')),

              const SizedBox(height: 60),
              buildMainButton('Send Code', () {
                // Navigate to next step: VerifyCodeScreen
              }),

              const Spacer(),
              buildBottomSwitch("Remember your password?", "Login", () {
                // Return to login screen
              }),
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
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Enter\nCode',
                style: GoogleFonts.urbanist(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryDark,
                  height: 1.1,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 80),

              buildLabel('Code'),
              TextField(
                keyboardType: TextInputType.number,
                decoration: customInputDecoration('Code'),
              ),

              const SizedBox(height: 60),
              buildMainButton('Verify Code', () {
                // Navigate to next step: SetNewPasswordScreen
              }),
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
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text(
                'Change\nPassword',
                style: GoogleFonts.urbanist(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryDark,
                  height: 1.1,
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(height: 60),

              buildLabel('Change Password'),
              TextField(obscureText: true, decoration: customInputDecoration('Password')),

              const SizedBox(height: 20),
              buildLabel('Confirm Password'),
              TextField(obscureText: true, decoration: customInputDecoration('Confirm Password')),

              const SizedBox(height: 60),
              buildMainButton('Change Password', () {
                // Execute password update action
              }),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}