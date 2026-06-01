import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_themes.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              Text('Login',
                  style: GoogleFonts.urbanist(fontSize: 48, fontWeight: FontWeight.bold, color: kPrimaryDark, letterSpacing: -1)),
              const SizedBox(height: 60),

              buildLabel('Email / Phone Number'),
              TextField(decoration: customInputDecoration('Email / Phone Number')),

              const SizedBox(height: 20),
              buildLabel('Password'),
              TextField(obscureText: true, decoration: customInputDecoration('Password')),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {}, // Route link out to request_reset_screen.dart
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero, // Proper style constraint
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text('Forgot Password?',
                      style: GoogleFonts.urbanist(color: kAccentYellow, fontSize: 15, fontWeight: FontWeight.bold)),
                ),
              ),

              const SizedBox(height: 20),
              buildMainButton('Login', () {}),

              const SizedBox(height: 40),
              buildSocialDivider('Or Login with'),

              const SizedBox(height: 30),
              buildSocialButtons(),

              const SizedBox(height: 40),
              buildBottomSwitch("You don't have an Account?", "Sign Up", () {}),
            ],
          ),
        ),
      ),
    );
  }
}