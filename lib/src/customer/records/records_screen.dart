import 'package:flutter/material.dart';
import '../../../core/shared_widgets/custom_bottom_navbar.dart';
import '../../theme/app_theme.dart';
import 'package:flutter/services.dart';

class RecordsScreen extends StatelessWidget {
  const RecordsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    // Sample statistics dataset matching the aesthetic profile
    final List<double> weeklySpendPercentages = [0.4, 0.85, 0.55, 0.3, 0.95, 0.6, 0.75];
    final List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Scaffold(
      backgroundColor: AppTheme.background,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // FIXED HERE: Forces status bar icons to contrast cleanly on a light background
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // Android: dark grey icons
          statusBarBrightness: Brightness.light, // iOS: dark grey icons
          systemNavigationBarColor: AppTheme.background,
          systemNavigationBarDividerColor: AppTheme.background,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        title: Text(
          'Financial Analytics',
          style: textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true, // FIXED HERE: Ensures layout safely stops above navigation gesture zones
        child: Column(
          children: [
            // 1. Analytics Custom Bar Graph Module Canvas
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppTheme.primaryDark,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Weekly Spending Insights',
                            style: textTheme.bodySmall?.copyWith(
                              color: Colors.white60,
                              fontSize: 13,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'KES 12,480',
                            style: textTheme.headlineSmall?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 26,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white.withAlpha((0.1 * 255).toInt()),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'This Week',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppTheme.accentYellow,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),

                  // Pure Native High-Contrast Bar Chart Architecture
                  SizedBox(
                    height: 130,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: List.generate(weeklySpendPercentages.length, (index) {
                        final bool isHighestDay = weeklySpendPercentages[index] == 0.95; // Highlight Peak
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                children: [
                                  // Background empty track capsule
                                  Container(
                                    width: 14,
                                    decoration: BoxDecoration(
                                      color: Colors.white.withAlpha((0.06 * 255).toInt()),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  // Active growth level metric capsule
                                  FractionallySizedBox(
                                    heightFactor: weeklySpendPercentages[index],
                                    child: Container(
                                      width: 14,
                                      decoration: BoxDecoration(
                                        color: isHighestDay ? AppTheme.accentYellow : const Color(0xFF2ECC71),
                                        borderRadius: BorderRadius.circular(8),
                                        boxShadow: [
                                          if (isHighestDay)
                                            BoxShadow(
                                              color: AppTheme.accentYellow.withAlpha((0.3 * 255).toInt()),
                                              blurRadius: 8,
                                              offset: const Offset(0, 2),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              weekDays[index],
                              style: textTheme.bodySmall?.copyWith(
                                color: isHighestDay ? AppTheme.accentYellow : Colors.white38,
                                fontWeight: isHighestDay ? FontWeight.bold : FontWeight.normal,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),

            // 2. Statistics Grid Dashboard Module
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              child: Row(
                children: [
                  _buildStatMatrixCard(context, 'Total Debt', 'KES 1,200', const Color(0xFFE74C3C), Icons.arrow_downward_rounded),
                  const SizedBox(width: 14),
                  _buildStatMatrixCard(context, 'Cleared Ledger', 'KES 5,450', const Color(0xFF2ECC71), Icons.arrow_upward_rounded),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // 3. Transactions Record Audit History Layout Sheet
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Audit Ledger Log',
                      style: textTheme.titleMedium?.copyWith(
                        color: AppTheme.primaryDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: ListView.separated(
                        padding: const EdgeInsets.only(bottom: 100),
                        itemCount: 4,
                        separatorBuilder: (context, index) => const Divider(height: 1, color: AppTheme.borderColor),
                        itemBuilder: (context, index) {
                          return ListTile(
                            contentPadding: EdgeInsets.zero,
                            leading: Container(
                              height: 40,
                              width: 40,
                              decoration: BoxDecoration(
                                color: AppTheme.background,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(Icons.store, color: AppTheme.primaryDark),
                            ),
                            title: Text(
                              index % 2 == 0 ? 'Mama Nani\'s Duka' : 'Baba Ester Shop',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: AppTheme.primaryDark,
                              ),
                            ),
                            subtitle: Text(
                              '24 Oct, 2026',
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppTheme.hintColor,
                              ),
                            ),
                            trailing: Text(
                              index % 2 == 0 ? '- KES 450' : '+ KES 1,200',
                              style: textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: index % 2 == 0 ? const Color(0xFFE74C3C) : const Color(0xFF2ECC71),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavbar(
        currentIndex: 2,
      ),
    );
  }

  Widget _buildStatMatrixCard(BuildContext context, String label, String amount, Color accentColor, IconData icon) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: AppTheme.borderColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  label,
                  style: textTheme.bodyMedium?.copyWith(
                    color: AppTheme.hintColor,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                Icon(icon, size: 16, color: accentColor),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              amount,
              style: textTheme.titleMedium?.copyWith(
                color: AppTheme.primaryDark,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}