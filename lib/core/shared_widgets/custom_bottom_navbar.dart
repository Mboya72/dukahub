import 'package:flutter/material.dart';
import '../../src/theme/app_theme.dart';

class CustomBottomNavbar extends StatelessWidget {
  const CustomBottomNavbar({super.key, required int currentIndex});

  // 1. Centralize your route destinations mapping cleanly here
  String _getRouteName(int index) {
    switch (index) {
      case 0: return '/customer-home';
      case 1: return '/shop';
      case 2: return '/records';
      case 3: return '/chats';
      case 4: return '/profile';
      default: return '/customer-home';
    }
  }

  // 2. Map route names back to indices to keep the animation active on the correct screen
  int _getSelectedIndex(BuildContext context) {
    final String? currentRoute = ModalRoute.of(context)?.settings.name;
    switch (currentRoute) {
      case '/customer-home': return 0;
      case '/shop': return 1;
      case '/records': return 2;
      case '/chats': return 3;
      case '/profile': return 4;
      default: return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = _getSelectedIndex(context);

    return Container(
      margin: const EdgeInsets.fromLTRB(16, 0, 16, 24),
      padding: const EdgeInsets.all(8),
      height: 72,
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(36),
      ),
      child: Row(
        children: [
          _buildItem(context, 0, currentIndex, Icons.home_outlined, 'Home'),
          _buildItem(context, 1, currentIndex, Icons.shopping_basket_outlined, 'Shop'),
          _buildItem(context, 2, currentIndex, Icons.description_outlined, 'Records'),
          _buildItem(context, 3, currentIndex, Icons.chat_bubble_outline_rounded, 'Chats'),
          _buildItem(context, 4, currentIndex, Icons.person_outline_rounded, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildItem(BuildContext context, int index, int currentIndex, IconData icon, String label) {
    final bool isSelected = currentIndex == index;

    return Expanded(
      flex: isSelected ? 2 : 1,
      child: GestureDetector(
        onTap: () {
          if (!isSelected) {
            // Push replacement destroys the previous screen to keep the navigation stack clean
            Navigator.pushReplacementNamed(context, _getRouteName(index));
          }
        },
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          height: double.infinity,
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.accentYellow : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: AppTheme.primaryDark,
                size: 24,
              ),
              if (isSelected) ...[
                const SizedBox(width: 6),
                Text(
                  label,
                  style: const TextStyle(
                    color: AppTheme.primaryDark,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}