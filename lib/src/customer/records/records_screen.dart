import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/shared_widgets/custom_bottom_navbar.dart';
import '../../theme/app_theme.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  int _activeToggleIndex = 0;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final List<double> weeklySpendPercentages = [0.4, 0.85, 0.55, 0.3, 0.95, 0.6, 0.75];
    final List<String> weekDays = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

    return Scaffold(
      backgroundColor: AppTheme.background,
      extendBody: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
        title: Text(
          'Activity Hub',
          style: textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryDark,
            fontWeight: FontWeight.w800,
            fontSize: 24,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          children: [
            const SizedBox(height: 8),

            // 1. Premium Segment Switcher Pill Tab
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.primaryDark.withAlpha(6),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: Row(
                  children: [
                    _buildPremiumToggleTab(0, 'Analytics'),
                    _buildPremiumToggleTab(1, 'Order Registry'),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Dynamic Body Framework
            Expanded(
              child: IndexedStack(
                index: _activeToggleIndex,
                children: [
                  // --- VIEW 0: REFINED ANALYTICS MASTER SHEET ---
                  Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 16),
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
                                    Text('Total Balance Spent', style: textTheme.bodySmall?.copyWith(color: Colors.white54, letterSpacing: 0.5)),
                                    const SizedBox(height: 2),
                                    Text('KES 12,480', style: textTheme.headlineSmall?.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Icon(Icons.bar_chart_rounded, color: AppTheme.accentYellow.withAlpha(200)),
                              ],
                            ),
                            const SizedBox(height: 24),
                            // Minimalist Chart
                            SizedBox(
                              height: 120,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: List.generate(weeklySpendPercentages.length, (index) {
                                  final bool isHighestDay = weeklySpendPercentages[index] == 0.95;
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Expanded(
                                        child: Stack(
                                          alignment: Alignment.bottomCenter,
                                          children: [
                                            Container(width: 8, decoration: BoxDecoration(color: Colors.white10, borderRadius: BorderRadius.circular(4))),
                                            FractionallySizedBox(
                                              heightFactor: weeklySpendPercentages[index],
                                              child: Container(
                                                width: 8,
                                                decoration: BoxDecoration(
                                                  color: isHighestDay ? AppTheme.accentYellow : const Color(0xFF2ECC71),
                                                  borderRadius: BorderRadius.circular(4),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      Text(weekDays[index], style: TextStyle(color: isHighestDay ? AppTheme.accentYellow : Colors.white38, fontSize: 10, fontWeight: FontWeight.bold)),
                                    ],
                                  );
                                }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 12),
                      // Matrix Cards
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          children: [
                            _buildPremiumStatCard('Pending Debt', 'KES 1,200', const Color(0xFFE74C3C)),
                            const SizedBox(width: 12),
                            _buildPremiumStatCard('Settled Funds', 'KES 5,450', const Color(0xFF2ECC71)),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                      Expanded(
                        child: _buildPremiumListContainer(
                          title: 'Audit Logs',
                          child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 4, bottom: 100),
                            itemCount: 3,
                            itemBuilder: (context, index) => _buildPremiumAuditTile(context, index),
                          ),
                        ),
                      ),
                    ],
                  ),

                  // --- VIEW 1: REGISTRY REGISTER LOGS ---
                  _buildPremiumListContainer(
                    title: 'System Order Tracking',
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.only(top: 4, bottom: 100),
                      itemCount: 4,
                      itemBuilder: (context, index) => _buildPremiumOrderTile(context, index),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavbar(currentIndex: 2),
    );
  }

  Widget _buildPremiumToggleTab(int index, String label) {
    final bool isSelected = _activeToggleIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => setState(() => _activeToggleIndex = index),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primaryDark : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.hintColor,
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPremiumStatCard(String label, String amount, Color accentColor) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(color: AppTheme.primaryDark.withAlpha(4), blurRadius: 10, offset: const Offset(0, 4))
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label, style: const TextStyle(color: AppTheme.hintColor, fontSize: 12, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text(amount, style: TextStyle(color: accentColor, fontWeight: FontWeight.w800, fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Widget _buildPremiumListContainer({required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(32), topRight: Radius.circular(32)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 16),
            child: Text(
              title, 
              style: const TextStyle(
                color: AppTheme.primaryDark, 
                fontWeight: FontWeight.w800, 
                fontSize: 17,
                letterSpacing: -0.3,
              ),
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }

  Widget _buildPremiumAuditTile(BuildContext context, int index) {
    final bool isExpense = index % 2 == 0;
    final Color transactionalColor = isExpense ? const Color(0xFFE74C3C) : const Color(0xFF2ECC71);
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppTheme.background.withAlpha(120),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppTheme.borderColor.withAlpha(100), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              // Premium Squircle Shape with contextual tinting
              Container(
                width: 44,
                height: 44,
                decoration: BoxDecoration(
                  color: transactionalColor.withAlpha(18),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  isExpense ? Icons.arrow_outward_rounded : Icons.south_west_rounded, 
                  size: 20, 
                  color: transactionalColor,
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    isExpense ? "Mama Nani's Duka" : "Baba Ester Shop", 
                    style: const TextStyle(
                      fontWeight: FontWeight.w700, 
                      color: AppTheme.primaryDark,
                      fontSize: 14.5,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      Text(
                        isExpense ? "Deni Issued" : "Cash Received",
                        style: TextStyle(
                          color: AppTheme.primaryDark.withAlpha(140), 
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 6),
                        width: 3,
                        height: 3,
                        decoration: const BoxDecoration(shape: BoxShape.circle, color: AppTheme.hintColor),
                      ),
                      const Text(
                        "11:32 AM", 
                        style: TextStyle(color: AppTheme.hintColor, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                isExpense ? "- KES 450" : "+ KES 1,200", 
                style: TextStyle(
                  fontWeight: FontWeight.w900, 
                  fontSize: 15,
                  color: transactionalColor,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 3),
              const Text(
                "Bal: KES 3,200",
                style: TextStyle(
                  color: AppTheme.hintColor,
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumOrderTile(BuildContext context, int index) {
    final bool isPending = index % 2 == 0;
    
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryDark.withAlpha(8),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(color: AppTheme.borderColor.withAlpha(80)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppTheme.primaryDark.withAlpha(12),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: const Icon(
                  Icons.local_mall_rounded, 
                  size: 20, 
                  color: AppTheme.primaryDark,
                ),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Order #LK-${9024 - index}", 
                    style: const TextStyle(
                      fontWeight: FontWeight.w800, 
                      color: AppTheme.primaryDark,
                      fontSize: 14.5,
                      letterSpacing: -0.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    "Baba Ester Shop • ${index + 1} items", 
                    style: const TextStyle(
                      color: AppTheme.hintColor, 
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              OrderStatusPill(isPending: isPending),
              const SizedBox(height: 6),
              Text(
                "KES ${(index + 1) * 320}",
                style: const TextStyle(
                  color: AppTheme.primaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Re-engineered Premium Status Badge
class OrderStatusPill extends StatelessWidget {
  final bool isPending;
  const OrderStatusPill({super.key, required this.isPending});

  @override
  Widget build(BuildContext context) {
    final Color stateColor = isPending ? const Color(0xFFF39C12) : const Color(0xFF2ECC71);
    
    return Container(
      padding: const EdgeInsets.fromLTRB(8, 4, 10, 4),
      decoration: BoxDecoration(
        color: stateColor.withAlpha(18),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Authentic vertical structural bar anchor
          Container(
            width: 3,
            height: 10,
            decoration: BoxDecoration(
              color: stateColor,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 6),
          Text(
            isPending ? 'Processing' : 'Delivered',
            style: TextStyle(
              fontSize: 10.5,
              fontWeight: FontWeight.w800,
              color: stateColor,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }
}