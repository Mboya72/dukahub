import 'package:flutter/material.dart';
import '../../../core/shared_widgets/custom_bottom_navbar.dart';
import '../../theme/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Profile',
          style: textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit_outlined, color: AppTheme.primaryDark),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Profile Header
            Center(
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: AppTheme.primaryDark.withValues(alpha: 0.1),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage('https://i.pravatar.cc/300'),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: AppTheme.accentYellow,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.camera_alt, size: 20, color: AppTheme.primaryDark),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'John Doe',
              style: textTheme.headlineMedium?.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: AppTheme.primaryDark,
              ),
            ),
            Text(
              'john.doe@example.com',
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 14,
                color: AppTheme.hintColor,
              ),
            ),
            const SizedBox(height: 32),

            // Menu Items Box container
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                children: [
                  _buildMenuItem(context, Icons.person_outline, 'Personal Information'),
                  _buildMenuItem(context, Icons.notifications_none, 'Notifications'),
                  _buildMenuItem(context, Icons.security_outlined, 'Security'),
                  _buildMenuItem(context, Icons.help_outline, 'Help & Support'),
                  _buildMenuItem(context, Icons.logout, 'Logout', isLast: true, color: const Color(0xFFE74C3C)),
                ],
              ),
            ),
            const SizedBox(height: 100), // Protect content viewing from navigation clearances
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavbar(
        currentIndex: 4,
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title, {bool isLast = false, Color? color}) {
    final textTheme = Theme.of(context).textTheme;
    final Color itemColor = color ?? AppTheme.primaryDark;

    return Column(
      children: [
        ListTile(
          leading: Icon(icon, color: itemColor),
          title: Text(
            title,
            style: textTheme.bodyLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: itemColor,
            ),
          ),
          trailing: Icon(Icons.chevron_right, size: 20, color: color != null ? const Color(0xFFE74C3C) : AppTheme.hintColor),
          onTap: () {},
        ),
        if (!isLast)
          const Divider(indent: 70, endIndent: 20, height: 1, color: AppTheme.borderColor),
      ],
    );
  }
}