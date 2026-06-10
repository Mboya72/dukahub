import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';

class ShopDetailsScreen extends StatelessWidget {
  const ShopDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: AppTheme.primaryDark, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: AppTheme.primaryDark),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.share_outlined, color: AppTheme.primaryDark),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Shop Master Profile Identity Box Header Ribbon
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.background,
                      border: Border.all(color: AppTheme.borderColor),
                    ),
                    child: const Icon(Icons.store, color: AppTheme.hintColor, size: 36),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Baba Ester Shop',
                              style: textTheme.titleLarge?.copyWith(
                                color: AppTheme.primaryDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              'Pro',
                              style: textTheme.bodyMedium?.copyWith(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.location_on, size: 14, color: AppTheme.hintColor),
                            const SizedBox(width: 4),
                            Text(
                              'Kasarani, Babadogo',
                              style: textTheme.bodyMedium?.copyWith(color: AppTheme.hintColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // 2. Metrics Performance Scoreboard Grid
            Row(
              children: [
                _buildMetricItem(context, Icons.star, '4.5 Rating', '120 Reviews'),
                const SizedBox(width: 12),
                _buildMetricItem(context, Icons.electric_bolt, 'Fast Delivery', 'Avg 15-30 mins'),
              ],
            ),
            const SizedBox(height: 24),

            // 3. Search Bar specifically for searching items INSIDE this single shop
            Container(
              height: 46,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(23),
              ),
              child: TextField(
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  hintText: 'Search inside this shop...',
                  hintStyle: textTheme.bodyMedium?.copyWith(color: AppTheme.hintColor),
                  prefixIcon: const Icon(Icons.search, color: AppTheme.primaryDark, size: 20),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(height: 24),

            // 4. Content Division Segment Header Ribbon
            Text(
              'Available Products',
              style: textTheme.titleMedium?.copyWith(
                color: AppTheme.primaryDark,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            // 5. Native Product Layout Grid View (Re-using product card blueprints)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.76,
              ),
              itemCount: 4,
              itemBuilder: (context, index) {
                return _buildShopProductCard(context);
              },
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricItem(BuildContext context, IconData icon, String title, String subtitle) {
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Icon(icon, color: const Color(0xFFFFAE34), size: 24),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: textTheme.bodyMedium?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.bold)),
                  Text(subtitle, style: textTheme.bodySmall?.copyWith(color: AppTheme.hintColor)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShopProductCard(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: const Icon(Icons.favorite_border, size: 20, color: AppTheme.primaryDark),
              ),
            ],
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 90,
                height: 90,
                color: AppTheme.background,
                child: const Icon(Icons.image, color: AppTheme.hintColor, size: 36),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '350 Ksh',
            style: textTheme.bodyLarge?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.w900),
          ),
          Text(
            'Dettol Liquid Antiseptic',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyMedium?.copyWith(color: AppTheme.primaryDark, fontWeight: FontWeight.w500, fontSize: 13),
          ),
          const SizedBox(height: 6),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(shape: BoxShape.circle, color: AppTheme.accentYellow),
                  child: const Icon(Icons.add, size: 16, color: AppTheme.primaryDark),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}