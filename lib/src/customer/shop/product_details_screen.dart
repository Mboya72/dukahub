import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../theme/app_theme.dart';
import 'shop_details_screen.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _quantity = 1;
  bool _isFavorited = false;

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
            icon: Icon(
              _isFavorited ? Icons.favorite : Icons.favorite_border,
              color: _isFavorited ? Colors.red : AppTheme.primaryDark,
            ),
            onPressed: () {
              setState(() {
                _isFavorited = !_isFavorited;
              });
            },
          ),
          const SizedBox(width: 8),
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      body: Column(
        children: [
          // 1. Large Product Showcase Box Image Area
          Expanded(
            flex: 4,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Center(
                child: Icon(
                  Icons.image,
                  size: 120,
                  color: AppTheme.hintColor.withAlpha(100),
                ),
              ),
            ),
          ),

          // 2. Bottom Bottom Details Sheet
          Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(36),
                  topRight: Radius.circular(36),
                ),
              ),
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title & Price Section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Dettol Liquid Antiseptic',
                              style: textTheme.headlineSmall?.copyWith(
                                color: AppTheme.primaryDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '500ml • Personal Care',
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppTheme.hintColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        '350 Ksh',
                        style: textTheme.headlineSmall?.copyWith(
                          color: AppTheme.primaryDark,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Interactive Vendor Attribution Link Row
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ShopDetailsScreen()),
                      );
                    },
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: AppTheme.background,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 40,
                            height: 40,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppTheme.accentYellow,
                            ),
                            child: const Icon(Icons.store, color: AppTheme.primaryDark),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Baba Ester Shop',
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: AppTheme.primaryDark,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Kasarani, Babadogo',
                                  style: textTheme.bodySmall?.copyWith(color: AppTheme.hintColor),
                                ),
                              ],
                            ),
                          ),
                          const Icon(Icons.arrow_forward_ios, size: 14, color: AppTheme.primaryDark),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Item Description Context Text
                  Text(
                    'Description',
                    style: textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Text(
                        'Dettol Liquid Antiseptic provides all-round family protection against germs. Highly recommended by medical professionals for localized structural surface cleaning, hygiene, and sanitization protocols.',
                        style: textTheme.bodyMedium?.copyWith(
                          color: AppTheme.primaryDark.withAlpha(180),
                          height: 1.5,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  // 3. Bottom Counter Action Toolbar Row Layout
                  Row(
                    children: [
                      // Incrementer Box Pill
                      Container(
                        height: 48,
                        decoration: BoxDecoration(
                          color: AppTheme.background,
                          borderRadius: BorderRadius.circular(24),
                        ),
                        child: Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove, size: 18, color: AppTheme.primaryDark),
                              onPressed: () {
                                if (_quantity > 1) setState(() => _quantity--);
                              },
                            ),
                            Text(
                              '$_quantity',
                              style: textTheme.titleMedium?.copyWith(
                                color: AppTheme.primaryDark,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add, size: 18, color: AppTheme.primaryDark),
                              onPressed: () => setState(() => _quantity++),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Add to Cart Master CTA
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppTheme.accentYellow,
                            foregroundColor: AppTheme.primaryDark,
                            elevation: 0,
                            height: 48,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                          ),
                          child: Text(
                            'Add to Basket',
                            style: textTheme.titleMedium?.copyWith(
                              color: AppTheme.primaryDark,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
    );
  }
}