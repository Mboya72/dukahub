import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBackgroundColor = Color(0xFFEAEFF2);
const Color kPrimaryDark = Color(0xFF032231);
const Color kAccentYellow = Color(0xFFFFC20E);
const Color kLabelColor = Color(0xFF032231);
const Color kHintColor = Color(0xFFA0AEC0);
const Color kSocialBtnColor = Color(0xFF032231);

InputDecoration customInputDecoration(String hint) {
  return InputDecoration(
    hintText: hint,
    hintStyle: GoogleFonts.urbanist(color: kHintColor, fontSize: 16),
    filled: true,
    fillColor: Colors.transparent,
    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: Color(0xFF718096), width: 1),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(30),
      borderSide: const BorderSide(color: kPrimaryDark, width: 1.5),
    ),
  );
}

// Reusable Components
Widget buildLabel(String text) {
  return Padding(
    padding: const EdgeInsets.only(left: 4, bottom: 8),
    child: Text(text, style: GoogleFonts.urbanist(color: kLabelColor, fontSize: 14, fontWeight: FontWeight.w600)),
  );
}

Widget buildMainButton(String title, VoidCallback onTap) {
  return SizedBox(
    width: double.infinity,
    height: 56,
    child: ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: kAccentYellow,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
        elevation: 0,
      ),
      child: Text(title, style: GoogleFonts.urbanist(color: kPrimaryDark, fontSize: 18, fontWeight: FontWeight.bold)),
    ),
  );
}

Widget buildSocialDivider(String label) {
  return Row(
    children: [
      const Expanded(child: Divider(color: Color(0xFF718096))),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Text(label, style: GoogleFonts.urbanist(color: kPrimaryDark, fontSize: 14)),
      ),
      const Expanded(child: Divider(color: Color(0xFF718096))),
    ],
  );
}

Widget buildSocialButtons() {
  return Row(
    children: [
      Expanded(child: _socialBtn('Apple', Icons.apple)),
      const SizedBox(width: 16),
      Expanded(child: _socialBtn('Google', Icons.g_mobiledata, isGoogle: true)),
    ],
  );
}

Widget _socialBtn(String label, IconData icon, {bool isGoogle = false}) {
  return Container(
    height: 56,
    decoration: BoxDecoration(
      color: kSocialBtnColor,
      borderRadius: BorderRadius.circular(28),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: isGoogle ? Colors.red : Colors.white, size: 28),
        const SizedBox(width: 8),
        Text(label, style: GoogleFonts.urbanist(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    ),
  );
}

Widget buildBottomSwitch(String text, String action, VoidCallback onTap) {
  return Center(
    child: GestureDetector(
      onTap: onTap,
      child: RichText(
        text: TextSpan(
          style: GoogleFonts.urbanist(color: kPrimaryDark, fontSize: 15),
          children: [
            TextSpan(text: '$text '),
            TextSpan(text: action, style: const TextStyle(color: kAccentYellow, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    ),
  );
}