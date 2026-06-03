import 'package:flutter/material.dart';
import '../../../core/shared_widgets/custom_bottom_navbar.dart';
import '../../theme/app_theme.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Marketplace',
          style: textTheme.titleLarge?.copyWith(
            color: AppTheme.primaryDark,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded, color: AppTheme.primaryDark),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Search Bar Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search for shops or products...',
                hintStyle: textTheme.bodyMedium?.copyWith(color: AppTheme.hintColor),
                prefixIcon: const Icon(Icons.search, color: AppTheme.hintColor),
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(vertical: 16),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          // Categories Horizontal Selector
          const SizedBox(height: 12),
          SizedBox(
            height: 38,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildCategoryPill(context, 'All Shops', isSelected: true),
                _buildCategoryPill(context, 'Groceries', isSelected: false),
                _buildCategoryPill(context, 'Clothing', isSelected: false),
                _buildCategoryPill(context, 'Electronics', isSelected: false),
              ],
            ),
          ),
          const SizedBox(height: 20),

          // Grid Layout containing active vendors/items
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 100), // Clears floating navbar path
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 0.82,
              ),
              itemCount: 6,
              itemBuilder: (context, index) {
                return _buildShopGridCard(context, index);
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CustomBottomNavbar(
        currentIndex: 1,
      ),
    );
  }

  Widget _buildCategoryPill(BuildContext context, String title, {required bool isSelected}) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primaryDark : Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.transparent : AppTheme.borderColor,
          width: 1,
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: textTheme.bodyMedium?.copyWith(
            color: isSelected ? Colors.white : AppTheme.primaryDark,
            fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildShopGridCard(BuildContext context, int index) {
    final textTheme = Theme.of(context).textTheme;
    final List<String> shops = [
      'Baba Ester Shop',
      'Hakuna Matata Shop',
      'Blessed Shop',
      'Mama Nani\'s Duka',
      'Upendo Provisioners',
      'Tumaini General Store'
    ];

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryDark.withValues(alpha: 0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Placeholder Banner Visual block
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.accentYellow.withValues(alpha: 0.15),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.storefront_rounded,
                  size: 44,
                  color: AppTheme.primaryDark.withValues(alpha: 0.7),
                ),
              ),
            ),
          ),
          // Metadata descriptions
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  shops[index % shops.length],
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: textTheme.bodyLarge?.copyWith(
                    color: AppTheme.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Verified Vendor',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppTheme.hintColor,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Open',
                      style: textTheme.labelSmall?.copyWith(
                        color: const Color(0xFF2ECC71),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Icon(
                      Icons.arrow_forward_rounded,
                      size: 16,
                      color: AppTheme.primaryDark,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}