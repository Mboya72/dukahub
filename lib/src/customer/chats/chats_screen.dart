import 'package:flutter/material.dart';
import '../../../core/shared_widgets/custom_bottom_navbar.dart';
import '../../theme/app_theme.dart';
import 'package:flutter/services.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.background,
      extendBody: true, // Crucial for showing content behind the rounded navbar
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        // FIXED HERE: Forces status bar icons to contrast cleanly on a light background
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: Brightness.dark, // Android: dark grey icons
          statusBarBrightness: Brightness.light, // iOS: dark grey icons
          systemNavigationBarColor: AppTheme.background,
          systemNavigationBarDividerColor: AppTheme.background,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
        title: Padding(
          padding: const EdgeInsets.only(left: 4, top: 12),
          child: Text(
            'Messages',
            style: textTheme.headlineLarge?.copyWith(
              color: AppTheme.primaryDark,
              fontWeight: FontWeight.bold,
              fontSize: 32,
              letterSpacing: -0.5,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 12),
            child: IconButton(
              icon: const Icon(Icons.search, size: 28, color: AppTheme.primaryDark),
              onPressed: () {},
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
              controller: _tabController,
              isScrollable: false,
              indicatorColor: const Color(0xFF1976D2), // Accent blue line matching reference image
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3,
              labelColor: const Color(0xFF1976D2),
              unselectedLabelColor: AppTheme.hintColor,
              labelStyle: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
              unselectedLabelStyle: textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('All'),
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1976D2),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          '2',
                          style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const Tab(text: 'Unread'),
                const Tab(text: 'Read'),
              ],
            ),
          ),
        ),
      ),
      body: SafeArea(
        top: false,
        bottom: true, // FIXED HERE: Ensures lists safely pad above navigation gesture zones
        child: TabBarView(
          controller: _tabController,
          children: [
            _buildMessageList(context),
            _buildMessageList(context), // Dynamic unread filter logic can plug here
            _buildMessageList(context), // Dynamic read filter logic can plug here
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavbar(
        currentIndex: 3,
      ),
    );
  }

  Widget _buildMessageList(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.fromLTRB(12, 16, 12, 110), // Padding avoids bottom navbar overlap
      itemCount: 6,
      itemBuilder: (context, index) {
        return _buildMessageTile(context);
      },
    );
  }

  Widget _buildMessageTile(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return InkWell(
      onTap: () {
        // Handle entering specific text conversation window
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Circular Avatar Profile Container matching Customer messages.png
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: AppTheme.borderColor),
              ),
              child: const Icon(Icons.person, color: AppTheme.hintColor, size: 36),
            ),
            const SizedBox(width: 14),

            // Conversation details block
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Baba Ester Shop',
                    style: textTheme.titleMedium?.copyWith(
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    'Sorry I forgot to send you the change',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: textTheme.bodyMedium?.copyWith(
                      color: AppTheme.primaryDark.withAlpha((0.8 * 255).toInt()),
                      fontWeight: FontWeight.w500,
                      fontSize: 13.5,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),

            // Time and Counter Status Pill Block
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '16:22 PM',
                  style: textTheme.bodySmall?.copyWith(
                    color: AppTheme.primaryDark,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
                const SizedBox(height: 6),
                Container(
                  height: 18,
                  width: 18,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1976D2),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
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
    );
  }
}