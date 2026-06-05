import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../core/shared_widgets/custom_bottom_navbar.dart';
import '../../theme/app_theme.dart';
import 'add_balance_screen.dart';
import 'all_transactions_screen.dart';
import 'pay_debt_screen.dart';

class CustomerHomeScreen extends StatefulWidget {
  const CustomerHomeScreen({super.key});

  @override
  State<CustomerHomeScreen> createState() => _CustomerHomeScreenState();
}

class _CustomerHomeScreenState extends State<CustomerHomeScreen> {
  bool _showBalance = true;
  bool _showDebt = true;
  final int _currentBottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    // FIXED: Instantiating textTheme at the root level of the build method
    final textTheme = Theme.of(context).textTheme;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: AppTheme.background, // Solid matching background color (LinkedIn style)
        systemNavigationBarDividerColor: AppTheme.background,
        systemNavigationBarIconBrightness: Brightness.dark, // Dark grey gesture pill line
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
      ),
      child: Scaffold(
        backgroundColor: AppTheme.background,
        body: SafeArea(
          top: false,
          bottom: true, // Forces layout content to stop cleanly right above the solid colored bar
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 16.0), // Kept presentation grid layout uniform
            child: Column(
              children: [
                const SizedBox(height: 30),

                // 1. Profile Header with Badged Notification Bell
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 48,
                          height: 48,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.primaryDark,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(24),
                            child: Image.network(
                              'https://i.pravatar.cc/150?img=33',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.person, color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello,',
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppTheme.primaryDark,
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              'Bruce Lee',
                              style: textTheme.titleLarge?.copyWith(
                                color: AppTheme.primaryDark,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    // Badged Notification Bell
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        InkWell(
                          onTap: () => Navigator.pushNamed(context, '/notifications'),
                          borderRadius: BorderRadius.circular(12),
                          child: Container(
                            height: 44,
                            width: 44,
                            decoration: BoxDecoration(
                              color: AppTheme.accentYellow,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.notifications_none_rounded,
                              color: AppTheme.primaryDark,
                              size: 26,
                            ),
                          ),
                        ),
                        Positioned(
                          top: -4,
                          right: -4,
                          child: IgnorePointer(
                            child: Container(
                              height: 18,
                              width: 18,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFF3B30),
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                '2',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  height: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // 2. Financial Metrics Cards Grid Panel
                Row(
                  children: [
                    // Balance Card
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        height: 146,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryDark,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Balance',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              _showBalance ? 'Ksh 980' : '••••••',
                              style: textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFF10CE5F),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const AddBalanceScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFF10CE5F),
                                    foregroundColor: AppTheme.primaryDark,
                                    minimumSize: const Size(64, 32),
                                    padding: const EdgeInsets.symmetric(horizontal: 12),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text('Add +', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                ),
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () => setState(() => _showBalance = !_showBalance),
                                  icon: Icon(
                                    _showBalance ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                    color: Colors.white54,
                                    size: 18,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),

                    // Debt Card
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(14),
                        height: 146,
                        decoration: BoxDecoration(
                          color: AppTheme.primaryDark,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Current Debt',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.white70,
                                fontSize: 13,
                              ),
                            ),
                            Text(
                              _showDebt ? 'Ksh 680' : '••••••',
                              style: textTheme.headlineMedium?.copyWith(
                                color: const Color(0xFFFF3B30),
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) => const PayDebtScreen()),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xFFFF3B30),
                                    foregroundColor: Colors.white,
                                    minimumSize: const Size(64, 32),
                                    padding: const EdgeInsets.symmetric(horizontal: 14),
                                    elevation: 0,
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                  ),
                                  child: const Text('Pay', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                                ),
                                IconButton(
                                  constraints: const BoxConstraints(),
                                  padding: EdgeInsets.zero,
                                  onPressed: () => setState(() => _showDebt = !_showDebt),
                                  icon: Icon(
                                    _showDebt ? Icons.visibility_outlined : Icons.visibility_off_outlined,
                                    color: Colors.white54,
                                    size: 18,
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
                const SizedBox(height: 20),

                // 3. Trusted Shops Section Header (Fixed title & routing)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Trusted Shops',
                      style: textTheme.titleMedium?.copyWith(
                        color: AppTheme.primaryDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // Optional: Navigate to a dedicated Trusted Shops screen here
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'See all',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppTheme.primaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                SizedBox(
                  height: 94,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return _buildTrustedShopCard(context);
                    },
                  ),
                ),
                const SizedBox(height: 16),

                // 4. Transactions Audit Records Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Transactions',
                      style: textTheme.titleMedium?.copyWith(
                        color: AppTheme.primaryDark,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AllTransactionsScreen()),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          'See all',
                          style: textTheme.bodySmall?.copyWith(
                            color: AppTheme.primaryDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                _buildTransactionListTile(context, 'Baba Ester\'s Shop', 'Paid by you • Nov 13', 'Ksh 300', 'Ksh 500', isDebtText: true),
                _buildTransactionListTile(context, 'Blessed Shop', 'Change • Nov 14', 'Ksh 95', 'Ksh 500', isDebtText: false),
                _buildTransactionListTile(context, 'Blessed Shop', 'Paid by you • Nov 14', 'Ksh 160', 'Ksh 500', isDebtText: true),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
        // FIXED: Shifted parameter context scope inside the correct Scaffold location boundaries
        bottomNavigationBar: CustomBottomNavbar(
          currentIndex: _currentBottomNavIndex,
        ),
      ),
    );
  }

  Widget _buildTrustedShopCard(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      width: 250,
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: AppTheme.background,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1578916171728-46686eac8d58?q=80&w=150',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(Icons.storefront, color: AppTheme.hintColor),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // FIXED TYPO HERE
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'Shop',
                    style: textTheme.labelSmall?.copyWith(
                      color: AppTheme.primaryDark,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Baba Ester\'s Shop',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppTheme.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(Icons.location_on_outlined, size: 12, color: AppTheme.primaryDark),
                    const SizedBox(width: 2),
                    Expanded(
                      child: Text(
                        'Nairobi, Lucky summer',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.bodySmall?.copyWith(color: AppTheme.primaryDark, fontSize: 11),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.star, size: 12, color: Colors.orange),
                  const SizedBox(width: 1),
                  Text(
                    '4.6',
                    style: textTheme.bodySmall?.copyWith(color: Colors.orange, fontWeight: FontWeight.bold, fontSize: 11),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                '(1,099)',
                style: textTheme.bodySmall?.copyWith(color: AppTheme.hintColor, fontSize: 10),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTransactionListTile(
      BuildContext context,
      String shopName,
      String subtitle,
      String primaryAmt,
      String secondaryAmt,
      {required bool isDebtText}
      ) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
                height: 40,
                width: 40,
                decoration: const BoxDecoration(
                  color: AppTheme.background,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_upward_rounded, color: AppTheme.primaryDark, size: 20),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shopName,
                    style: textTheme.bodyLarge?.copyWith(
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: textTheme.bodySmall?.copyWith(
                      color: AppTheme.hintColor,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                primaryAmt,
                style: textTheme.bodyLarge?.copyWith(
                  color: isDebtText ? const Color(0xFFFF3B30) : const Color(0xFF10CE5F),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                secondaryAmt,
                style: textTheme.bodySmall?.copyWith(
                  color: AppTheme.hintColor,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}