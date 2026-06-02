import 'package:flutter/material.dart';
import '../../../core/shared_widgets/custom_bottom_navbar.dart';
import '../../theme/app_theme.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  int _currentBottomNavIndex = 0;
  bool _showBalance = true;
  bool _showDebt = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24),

              // 1. Updated Profile Header with Circle Avatar matching "Customer Homescreen_2.png"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      // Circular Profile Photo Asset Layout
                      Container(
                        width: 56,
                        height: 56,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                          image: const DecorationImage(
                            image: AssetImage('assets/images/bruce_lee.png'), // Swap with your actual project asset path
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hello,',
                            style: TextStyle(
                              color: AppTheme.primaryDark,
                              fontSize: 28,
                              fontWeight: FontWeight.w400,
                              height: 1.1,
                            ),
                          ),
                          Text(
                            'Bruce Lee',
                            style: TextStyle(
                              color: AppTheme.primaryDark,
                              fontSize: 36,
                              fontWeight: FontWeight.bold,
                              height: 1.1,
                              letterSpacing: -0.5,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Notification Alert Bell Ring Wrapper Button
                  Container(
                    height: 52,
                    width: 52,
                    decoration: const BoxDecoration(
                      color: AppTheme.accentYellow,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      color: AppTheme.primaryDark,
                      size: 28,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // 2. Financial Metrics Balance & Debt Matrix Layout
              Row(
                children: [
                  // Balance Sheet Display Module
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryDark,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Current Balance',
                            style: TextStyle(
                              color: AppTheme.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _showBalance ? 'Ksh 980' : '••••••',
                            style: const TextStyle(
                              color: Color(0xFF2ECC71),
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF2ECC71),
                                  foregroundColor: AppTheme.primaryDark,
                                  minimumSize: const Size(70, 36),
                                  padding: const EdgeInsets.symmetric(horizontal: 12),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Add +', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ),
                              IconButton(
                                onPressed: () => setState(() => _showBalance = !_showBalance),
                                icon: Icon(
                                  _showBalance ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                  color: AppTheme.hintColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Credit Debt Tracking Matrix Module
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      height: 150,
                      decoration: BoxDecoration(
                        color: AppTheme.primaryDark,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Current Debt',
                            style: TextStyle(
                              color: AppTheme.hintColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _showDebt ? 'Ksh 680' : '••••••',
                            style: const TextStyle(
                              color: Color(0xFFE74C3C),
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFE74C3C),
                                  foregroundColor: Colors.white,
                                  minimumSize: const Size(70, 36),
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('Pay', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                              ),
                              IconButton(
                                onPressed: () => setState(() => _showDebt = !_showDebt),
                                icon: Icon(
                                  _showDebt ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                  color: AppTheme.hintColor,
                                  size: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 28),

              // 3. Trusted Vendors Stack Layout Section
              const Text(
                'Trusted Shops',
                style: TextStyle(
                  color: AppTheme.primaryDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildShopRowTile('Baba Ester Shop', '10,000 + Spent'),
              _buildShopRowTile('Hakuna Matata Shop', '7,000 + Spent'),
              const SizedBox(height: 24),

              // 4. Financial Audit Transaction Records Line Log
              const Text(
                'Recent Transactions',
                style: TextStyle(
                  color: AppTheme.primaryDark,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              _buildTransactionLogTile('Baba Ester Shop', '21 May, 02:01 PM', '-Ksh 300'),
              _buildTransactionLogTile('Baba Ester Shop', '19 May, 07:50 AM', '-Ksh 500'),
              _buildTransactionLogTile('Hakuna Matata Shop', '17 May, 08:01 PM', '-Ksh 425'),
              _buildTransactionLogTile('Blessed Shop', '15 May, 06:31 AM', '-Ksh 250'),
              const SizedBox(height: 100), // Protect content viewing from navigation clearances
            ],
          ),
        ),
      ),

      // 5. Implementing the Extracted Navigation Component Framework
      bottomNavigationBar: CustomBottomNavbar(
        currentIndex: _currentBottomNavIndex,
        onTap: (index) {
          setState(() {
            _currentBottomNavIndex = index;
          });
        },
      ),
    );
  }

  Widget _buildShopRowTile(String title, String spentAmt) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppTheme.accentYellow.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.storefront_rounded, color: AppTheme.primaryDark),
              ),
              const SizedBox(width: 14),
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.primaryDark,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Text(
            spentAmt,
            style: const TextStyle(
              color: Color(0xFF2ECC71),
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionLogTile(String shopName, String timestamp, String amount) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 48,
                width: 48,
                decoration: BoxDecoration(
                  color: AppTheme.accentYellow.withValues(alpha: 0.25),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.storefront_rounded, color: AppTheme.primaryDark),
              ),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
                    style: const TextStyle(
                      color: AppTheme.primaryDark,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    timestamp,
                    style: const TextStyle(
                      color: AppTheme.hintColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Text(
            amount,
            style: const TextStyle(
              color: Color(0xFFE74C3C),
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}