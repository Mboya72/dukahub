import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';
import 'package:flutter/services.dart';

class AllTransactionsScreen extends StatefulWidget {
  const AllTransactionsScreen({super.key});

  @override
  State<AllTransactionsScreen> createState() => _AllTransactionsScreenState();
}

class _AllTransactionsScreenState extends State<AllTransactionsScreen> {
  String _selectedFilter = 'All';
  final List<String> _filters = ['All', 'Completed', 'Pending', 'Disputes'];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // FIXED HERE: Replaces AnnotatedRegion to guarantee the AppBar forces dark icons
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // Keeps background transparent
          statusBarIconBrightness: Brightness.dark, // Android: Dark icons
          statusBarBrightness: Brightness.light, // iOS: Dark icons
          systemNavigationBarColor: AppTheme.background,
          systemNavigationBarDividerColor: AppTheme.background,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, color: AppTheme.primaryDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Transaction History',
          style: textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.tune_rounded, color: AppTheme.primaryDark),
            onPressed: () {
              // Optional: Add advanced date range picker filter here
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        top: false,
        bottom: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Horizontal Status Filter Pills Bar
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                itemCount: _filters.length,
                itemBuilder: (context, index) {
                  final filter = _filters[index];
                  final isSelected = _selectedFilter == filter;
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: InkWell(
                      onTap: () => setState(() => _selectedFilter = filter),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: isSelected ? AppTheme.primaryDark : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? Colors.transparent : Colors.black12,
                          ),
                        ),
                        child: Text(
                          filter,
                          style: TextStyle(
                            color: isSelected ? Colors.white : AppTheme.primaryDark,
                            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),

            // 2. Transactions Timeline Stream List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildSectionHeader(context, 'November 2026'),
                  _buildTransactionHistoryTile(context, 'Blessed Shop', 'Change • Nov 14', 'Ksh 95', 'Ksh 500', isDebtText: false),
                  _buildTransactionHistoryTile(context, 'Blessed Shop', 'Paid by you • Nov 14', 'Ksh 160', 'Ksh 500', isDebtText: true),
                  _buildTransactionHistoryTile(context, 'Baba Ester\'s Shop', 'Paid by you • Nov 13', 'Ksh 300', 'Ksh 500', isDebtText: true),

                  const SizedBox(height: 12),
                  _buildSectionHeader(context, 'October 2026'),
                  _buildTransactionHistoryTile(context, 'Wallet Topup', 'M-Pesa STK Push • Oct 28', 'Ksh 2,000', 'Success', isDebtText: false, customIcon: Icons.add_card_rounded),
                  _buildTransactionHistoryTile(context, 'Hakuna Matata Shop', 'Paid by you • Oct 15', 'Ksh 425', 'Ksh 1,000', isDebtText: true),
                  _buildTransactionHistoryTile(context, 'Baba Ester\'s Shop', 'Dispute Resolved • Oct 10', 'Ksh 500', 'Reversed', isDebtText: false, customIcon: Icons.gavel_rounded),

                  const SizedBox(height: 12),
                  _buildSectionHeader(context, 'September 2026'),
                  _buildTransactionHistoryTile(context, 'Blessed Shop', 'Paid by you • Sep 02', 'Ksh 250', 'Ksh 500', isDebtText: true),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
      child: Text(
        title,
        style: Theme.of(context).textTheme.bodySmall?.copyWith(
          color: AppTheme.hintColor,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildTransactionHistoryTile(
      BuildContext context,
      String shopName,
      String subtitle,
      String primaryAmt,
      String secondaryAmt, {
        required bool isDebtText,
        IconData? customIcon,
      }) {
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
                child: Icon(
                  customIcon ?? (isDebtText ? Icons.arrow_upward_rounded : Icons.arrow_downward_rounded),
                  color: AppTheme.primaryDark,
                  size: 18,
                ),
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
                isDebtText ? '-$primaryAmt' : '+$primaryAmt',
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