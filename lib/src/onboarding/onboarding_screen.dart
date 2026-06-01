import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  // Visual layout data mapped directly from WelcomeScreen assets
  final List<Map<String, String>> _onboardingData = [
    {
      'image': 'assets/images/WelcomeScreen.png',
      'title': 'One Record,\nZero Disputes',
      'description': 'Digitize your Ledger so everyone stays on the same page, with zero \'he-said-she-said\' at the counter.',
    },
    {
      'image': 'assets/images/WelcomeScreen2.png',
      'title': 'Seamless\nShopping',
      'description': 'Send the kids to the shop with confidence—every credit and purchase is tracked instantly on your phone.',
    },
    {
      'image': 'assets/images/WelcomeScreen3.png',
      'title': 'Your Local Shop,\nDigitized',
      'description': 'Turn your neighborhood "Duka" into a digital storefront where customers can see what\'s in stock before they even arrive.',
    },
  ];

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _nextPage() {
    if (_currentIndex < _onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  // Beautifully opens a custom, premium role selector frame
  void _showRoleSelectionPopup(BuildContext context) {
    const Color textPrimaryColor = Color(0xFF032231);
    const Color textSecondaryColor = Color(0xFF2C3E50);
    const Color accentYellow = Color(0xFFFFC20E);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent, // Allows custom canvas clipping below
      builder: (context) {
        return BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8), // Premium blur glass effect over background
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            decoration: const BoxDecoration(
              color: Color(0xFFF8FAFC), // Ultra clean off-white card canvas
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32),
                topRight: Radius.circular(32),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top handle indicator line accent
                Center(
                  child: Container(
                    width: 48,
                    height: 5,
                    decoration: BoxDecoration(
                      color: textSecondaryColor.withValues(alpha: 0.2),
                      borderRadius: BorderRadius.circular(2.5),
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Text(
                  'Choose Your Account Type',
                  style: GoogleFonts.urbanist(
                    color: textPrimaryColor,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Select how you intend to use DukaHub to continue.',
                  style: GoogleFonts.urbanist(
                    color: textSecondaryColor,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 28),

                // Shopkeeper Profile Mode Card Item
                _buildRoleCard(
                  context: context,
                  title: 'I am a Shopkeeper',
                  subtitle: 'Manage debts (Daftari), track stock, and send automated client reminders.',
                  icon: Icons.storefront_rounded,
                  accentColor: accentYellow,
                  textColor: textPrimaryColor,
                  subTextColor: textSecondaryColor,
                  onTap: () {
                    Navigator.pop(context);
                    debugPrint('Route Selected: Shopkeeper Auth Workspace');
                  },
                ),
                const SizedBox(height: 16),

                // Customer Profile Mode Card Item
                _buildRoleCard(
                  context: context,
                  title: 'I am a Customer',
                  subtitle: 'Track your personal store credits, orders, and view local inventory layouts.',
                  icon: Icons.shopping_bag_rounded,
                  accentColor: textPrimaryColor,
                  textColor: textPrimaryColor,
                  subTextColor: textSecondaryColor,
                  onTap: () {
                    Navigator.pop(context);
                    debugPrint('Route Selected: Customer Auth Workspace');
                  },
                ),
                const SizedBox(height: 12),
              ],
            ),
          ),
        );
      },
    );
  }

  // Reusable card design system helper for selection components
  Widget _buildRoleCard({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required Color accentColor,
    required Color textColor,
    required Color subTextColor,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: const Color(0xFFE2E8F0),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF0F172A).withValues(alpha:0.03),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: accentColor.withValues(alpha:0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: accentColor == Colors.white ? textColor : accentColor, size: 26),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.urbanist(
                      color: textColor,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: GoogleFonts.urbanist(
                      color: subTextColor,
                      fontSize: 13,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right_rounded, color: subTextColor.withValues(alpha:0.6)),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Color backgroundCanvas = Color(0xFFEAEFF2);
    const Color textPrimaryColor = Color(0xFF032231);
    const Color textSecondaryColor = Color(0xFF2C3E50);
    const Color accentYellow = Color(0xFFFFC20E);

    return Scaffold(
      backgroundColor: backgroundCanvas,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: _onPageChanged,
                itemCount: _onboardingData.length,
                itemBuilder: (context, index) {
                  final item = _onboardingData[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 28.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        Expanded(
                          flex: 5,
                          child: Center(
                            child: Image.asset(
                              item['image']!,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Expanded(
                          flex: 4,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['title']!,
                                style: GoogleFonts.urbanist(
                                  color: textPrimaryColor,
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  height: 1.1,
                                  letterSpacing: -0.5,
                                ),
                              ),
                              const SizedBox(height: 20),
                              Text(
                                item['description']!,
                                style: GoogleFonts.urbanist(
                                  color: textSecondaryColor,
                                  fontSize: 16,
                                  height: 1.4,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(28.0, 0, 28.0, 36.0),
              child: _currentIndex == _onboardingData.length - 1
                  ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () => _showRoleSelectionPopup(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: accentYellow,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(28),
                        ),
                      ),
                      child: Text(
                        'Get Started',
                        style: GoogleFonts.urbanist(
                          color: textPrimaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => _showRoleSelectionPopup(context),
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.urbanist(
                          fontSize: 14,
                          color: textSecondaryColor,
                        ),
                        children: [
                          const TextSpan(text: 'You have an Account? '),
                          TextSpan(
                            text: 'Login',
                            style: GoogleFonts.urbanist(
                              color: textPrimaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
                  : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Verified standard enum syntax
                children: [
                  GestureDetector(
                    onTap: () => _showRoleSelectionPopup(context),
                    child: Text(
                      'Skip',
                      style: GoogleFonts.urbanist(
                        color: textSecondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _nextPage,
                    child: Container(
                      width: 56,
                      height: 56,
                      decoration: const BoxDecoration(
                        color: accentYellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_forward,
                        color: textPrimaryColor,
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}