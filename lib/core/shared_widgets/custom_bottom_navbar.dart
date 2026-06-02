import 'package:flutter/material.dart';
import '../../src/theme/app_theme.dart';

class CustomBottomNavbar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavbar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
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
          _buildItem(0, Icons.home_outlined, 'Home'),
          _buildItem(1, Icons.shopping_basket_outlined, 'Shop'),
          _buildItem(2, Icons.description_outlined, 'Records'),
          _buildItem(3, Icons.chat_bubble_outline_rounded, 'Chats'),
          _buildItem(4, Icons.person_outline_rounded, 'Profile'),
        ],
      ),
    );
  }

  Widget _buildItem(int index, IconData icon, String label) {
    final bool isSelected = currentIndex == index;

    return Expanded(
      flex: isSelected ? 2 : 1,
      child: GestureDetector(
        onTap: () => onTap(index),
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