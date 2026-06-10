import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class AllTrustedShopsScreen extends StatelessWidget {
  const AllTrustedShopsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: AppTheme.background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Trusted Shops',
          style: textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryDark,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: const IconThemeData(color: AppTheme.primaryDark),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: 10, // Replace with your actual data length
        itemBuilder: (context, index) {
          // You can reuse your _buildTrustedShopCard logic here
          // or create a dedicated ShopCard widget for reusability.
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: _buildFullWidthShopCard(context),
          );
        },
      ),
    );
  }

  Widget _buildFullWidthShopCard(BuildContext context) {
    // Reusing the styling logic from your home screen
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            height: 60, width: 60,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(12), color: AppTheme.background),
            child: const Icon(Icons.storefront, color: AppTheme.primaryDark),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Baba Ester's Shop", style: TextStyle(fontWeight: FontWeight.bold)),
                Text("Nairobi, Lucky Summer", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
              ],
            ),
          ),
          const Icon(Icons.star, size: 16, color: Colors.orange),
          const Text(" 4.6", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}