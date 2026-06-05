import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
      color: Colors.transparent,
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 12),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(36),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryDark.withAlpha((0.08 * 255).toInt()),
              blurRadius: 20,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildNavItem(context, 0, 'assets/icons/home.svg', 'Home', '/customer-home'),
            _buildNavItem(context, 1, 'assets/icons/shop.svg', 'Shop', '/shop'),
            _buildNavItem(context, 2, 'assets/icons/records.svg', 'Records', '/records'),
            _buildNavItem(context, 3, 'assets/icons/messages.svg', 'Chats', '/chats'),
            _buildNavItem(context, 4, 'assets/icons/profile.svg', 'Profile', '/profile'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(
      BuildContext context,
      int index,
      String svgPath,
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
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 18 : 10,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.accentYellow : Colors.transparent,
          borderRadius: BorderRadius.circular(28),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // AnimatedContainer automatically smooths the size transition
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              // FIXED HERE: Selected icon is explicitly smaller (18) than non-selected ones (24)
              height: isSelected ? 18 : 24,
              child: SvgPicture.asset(
                svgPath,
                fit: BoxFit.contain,
                colorFilter: const ColorFilter.mode(
                  AppTheme.primaryDark,
                  BlendMode.srcIn,
                ),
              ),
            ),
            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                label,
                style: textTheme.bodyMedium?.copyWith(
                  color: AppTheme.primaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}