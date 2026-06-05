import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class PayDebtScreen extends StatelessWidget {
  const PayDebtScreen({super.key});

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
          'Clear Outstanding Debt',
          style: textTheme.titleLarge?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Outstanding Summary Banner Box
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppTheme.primaryDark,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  const Text(
                    'Total Outstanding Due',
                    style: TextStyle(color: Colors.white70, fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Ksh 680',
                    style: TextStyle(color: Color(0xFFFF3B30), fontSize: 36, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Divider(color: Colors.white.withOpacity(0.15)),
                  const SizedBox(height: 8),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Your Available Balance:', style: TextStyle(color: Colors.white54, fontSize: 13)),
                      Text('Ksh 980', style: TextStyle(color: Color(0xFF10CE5F), fontWeight: FontWeight.bold, fontSize: 14)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            Text(
              'Account Breakdown Liabilities',
              style: textTheme.bodyMedium?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),

            // Itemized store debt list block
            Container(
              padding: const EdgeInsets.all(16),
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
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: AppTheme.background, shape: BoxShape.circle),
                        child: const Icon(Icons.storefront_rounded, color: AppTheme.primaryDark),
                      ),
                      const SizedBox(width: 14),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Baba Ester\'s Shop', style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold, color: AppTheme.primaryDark)),
                          const Text('Accrued Nov 13', style: TextStyle(color: AppTheme.hintColor, fontSize: 12)),
                        ],
                      ),
                    ],
                  ),
                  const Text('Ksh 680', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: AppTheme.primaryDark)),
                ],
              ),
            ),

            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Complete ledger logic clearing here
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFF3B30), // Debt Warning Red
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 54),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                elevation: 0,
              ),
              child: const Text('Pay from Wallet Balance', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}