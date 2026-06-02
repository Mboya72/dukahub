import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Premium Palette
  static const Color background = Color(0xFFEAEFF2);
  static const Color primaryDark = Color(0xFF032231);
  static const Color accentYellow = Color(0xFFFFC20E);
  static const Color labelColor = Color(0xFF032231);
  static const Color hintColor = Color(0xFFA0AEC0);
  static const Color borderColor = Color(0xFF718096);

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: background,
      primaryColor: primaryDark,

      // Setting your custom local variable font family globally
      fontFamily: 'Urbanist',

      // Global Typography Matrix configurations
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 48,
          fontWeight: FontWeight.bold, // Uses the thick axis of your variable font
          color: primaryDark,
          letterSpacing: -1,
          height: 1.1,
        ),
        bodyLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400, // Seamlessly snaps to regular weight axis
          color: primaryDark,
        ),
      ),

      // Global Input Decoration Themes
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.transparent,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        hintStyle: const TextStyle(color: hintColor, fontSize: 16, fontFamily: 'Urbanist'),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: borderColor, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: primaryDark, width: 1.5),
        ),
      ),

      // Global Button Customizations
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accentYellow,
          foregroundColor: primaryDark,
          minimumSize: const Size.fromHeight(56),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
          elevation: 0,
          textStyle: const TextStyle(
            fontFamily: 'Urbanist',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  // Helper Custom Form Label Widget
  static Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 4, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: labelColor,
          fontSize: 14,
          fontWeight: FontWeight.w600, // Dynamically maps weight values from asset
        ),
      ),
    );
  }

  // Shared Bottom Navigation Action Text Switch
  static Widget buildBottomSwitch(String text, String action, VoidCallback onTap) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            style: const TextStyle(color: primaryDark, fontSize: 15, fontFamily: 'Urbanist'),
            children: [
              TextSpan(text: '$text '),
              TextSpan(
                text: action,
                style: const TextStyle(color: accentYellow, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}