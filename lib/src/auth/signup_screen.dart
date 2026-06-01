import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'auth_themes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

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
              const SizedBox(height: 40),
              Text('Sign Up',
                  style: GoogleFonts.urbanist(fontSize: 48, fontWeight: FontWeight.bold, color: kPrimaryDark, letterSpacing: -1)),
              const SizedBox(height: 40),

              buildLabel('First and Last name'),
              TextField(decoration: customInputDecoration('First and Last name')),

              const SizedBox(height: 20),
              buildLabel('Email / Phone Number'),
              TextField(decoration: customInputDecoration('Email / Phone Number')),

              const SizedBox(height: 20),
              buildLabel('Password'),
              TextField(obscureText: true, decoration: customInputDecoration('Password')),

              const SizedBox(height: 20),
              buildLabel('Confirm Password'),
              TextField(obscureText: true, decoration: customInputDecoration('Confirm Password')),

              const SizedBox(height: 40),
              buildMainButton('Sign Up', () {}),

              const SizedBox(height: 30),
              buildSocialDivider('Or sign up with'),

              const SizedBox(height: 30),
              buildSocialButtons(),

              const SizedBox(height: 30),
              buildBottomSwitch("You have an Account?", "Login", () {}),
            ],
          ),
        ),
      ),
    );
  }
}