import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppTheme.primaryDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Notifications',
          style: textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert_rounded, color: AppTheme.primaryDark),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        children: [
          _buildTimeSectionHeader(context, 'Today'),
          _buildNotificationItem(
            context: context,
            icon: Icons.calendar_today_rounded,
            iconColor: AppTheme.primaryDark,
            title: 'Order Confirmed by Baba Ester',
            subtitle: 'Today, 29th November • 01:00 PM',
            time: '09:41 AM',
            isUnread: true,
          ),
          _buildNotificationItem(
            context: context,
            icon: Icons.calendar_today_rounded,
            iconColor: AppTheme.primaryDark,
            title: 'Delivery Pickup Arranged',
            subtitle: 'Today, 29th November • 02:30 PM',
            time: '08:20 AM',
            isUnread: false,
          ),

          const SizedBox(height: 16),
          _buildTimeSectionHeader(context, 'Yesterday'),
          _buildNotificationItem(
            context: context,
            icon: Icons.check_circle_outline_rounded,
            iconColor: const Color(0xFF2ECC71), // Success green accent
            title: 'Garment Processing Completed',
            subtitle: 'Your tailoring workflow has been completed with...',
            time: '05:00 PM',
            isUnread: false,
          ),
          _buildNotificationItem(
            context: context,
            icon: Icons.calendar_today_rounded,
            iconColor: AppTheme.primaryDark,
            title: 'Booking Schedule Updated',
            subtitle: 'Yesterday, 28th November • 01:00 PM',
            time: '11:00 AM',
            isUnread: false,
          ),

          const SizedBox(height: 16),
          _buildTimeSectionHeader(context, '27 November 2026'),
          _buildNotificationItem(
            context: context,
            icon: Icons.cancel_outlined,
            iconColor: const Color(0xFFE74C3C), // Error/Alert red accent
            title: 'Order Dispute Handled',
            subtitle: 'Your payment ledger dispute has been resolved with...',
            time: '12:05 PM',
            isUnread: false,
          ),

          const SizedBox(height: 16),
          _buildTimeSectionHeader(context, '26 November 2026'),
          _buildNotificationItem(
            context: context,
            icon: Icons.waving_hand_outlined,
            iconColor: AppTheme.accentYellow,
            title: 'Welcome Onboard Maria! 🎉',
            subtitle: 'Explore active grassroots shops and track your financial journey.',
            time: '01:30 PM',
            isUnread: false,
            actionButtons: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primaryDark,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  minimumSize: const Size(90, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('Take a tour', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: AppTheme.primaryDark,
                  side: const BorderSide(color: AppTheme.borderColor),
                  minimumSize: const Size(80, 32),
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text('No, thanks', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeSectionHeader(BuildContext context, String title) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.only(top: 8, bottom: 12, left: 4),
      child: Text(
        title,
        style: textTheme.bodySmall?.copyWith(
          color: AppTheme.hintColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildNotificationItem({
    required BuildContext context,
    required IconData icon,
    required Color iconColor,
    required String title,
    required String subtitle,
    required String time,
    required bool isUnread,
    List<Widget>? actionButtons,
  }) {
    final textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Styled Icon frame block
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.08),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 14),

          // Central text metadata panel
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppTheme.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppTheme.hintColor,
                    fontSize: 13,
                    height: 1.3,
                  ),
                ),
                if (actionButtons != null) ...[
                  const SizedBox(height: 10),
                  Row(children: actionButtons),
                ],
              ],
            ),
          ),
          const SizedBox(width: 8),

          // Time Stamp / Unread marker configuration column
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                time,
                style: textTheme.bodySmall?.copyWith(
                  color: AppTheme.hintColor,
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
              if (isUnread) ...[
                const SizedBox(height: 8),
                Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1976D2), // Accent alert dot
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '1',
                      style: TextStyle(color: Colors.white, fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}