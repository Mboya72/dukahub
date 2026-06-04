import 'package:flutter/material.dart';
import '../../src/theme/app_theme.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // This ensures the root canvas container layer is completely clear
      color: Colors.transparent,
      padding: const EdgeInsets.only(left: 16, right: 16, bottom: 20, top: 8),
      child: Container(
        height: 66,
        decoration: BoxDecoration(
          color: Colors.white, // The actual visible rounded pill background
          borderRadius: BorderRadius.circular(33),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryDark.withValues(alpha: 0.08),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(context, 0, Icons.home_outlined, Icons.home, 'Home', '/customer-home'),
            _buildNavItem(context, 1, Icons.shopping_basket_outlined, Icons.shopping_basket, 'Shop', '/shop'),
            _buildNavItem(context, 2, Icons.description_outlined, Icons.description, 'Records', '/records'),
            _buildNavItem(context, 3, Icons.chat_bubble_outline, Icons.chat_bubble, 'Chats', '/chats'),
            _buildNavItem(context, 4, Icons.person_outline, Icons.person, 'Profile', '/profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context,
      int index,
      IconData unselectedIcon,
      IconData selectedIcon,
      String label,
      String routeName,
      ) {
    final bool isSelected = currentIndex == index;
    final textTheme = Theme.of(context).textTheme;

    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          Navigator.pushReplacementNamed(context, routeName);
        }
      },
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentYellow : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              isSelected ? selectedIcon : unselectedIcon,
              color: AppTheme.primaryDark,
              size: 22,
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppTheme.primaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}