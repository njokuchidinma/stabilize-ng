import 'package:flutter/material.dart';
import 'dart:ui'; // Needed for the glassmorphism blur effect on housing cards
// Ensure these paths match your actual project name in pubspec.yaml
import 'package:stabilize/core/widgets/category_icon.dart';
import 'package:stabilize/core/widgets/service_card.dart';
import 'package:stabilize/features/directory/artisan_profile.dart';
import 'package:stabilize/features/directory/search.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color secondaryColor = Color(0xFF8A5100);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerLow = Color(0xFFF3F4F5);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      // Notice: No bottomNavigationBar here! MainLayout handles it now.
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 1. CUSTOM APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_back, color: primaryColor),
                        const SizedBox(width: 16),
                        Image.asset(
                          'assets/images/logo.png',
                          width: 30,
                          height: 30,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 8),
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            children: [
                              TextSpan(
                                text: 'Stabilize ',
                                style: TextStyle(color: primaryColor),
                              ),
                              TextSpan(
                                text: 'NG',
                                style: TextStyle(color: onSurfaceColor),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: surfaceContainerHigh,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 2. WELCOME HEADER
                Text(
                  'Thursday, 24 Oct',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: onSurfaceVariant.withValues(alpha: 0.8),
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Welcome back, Frank –\nAbuja',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 28,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                    height: 1.2,
                    letterSpacing: -0.5,
                  ),
                ),
                const SizedBox(height: 24),

                // 3. SEARCH BAR WITH FILTER BUTTON
                Container(
                  height: 56,
                  decoration: BoxDecoration(
                    color: surfaceContainerHigh,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: 16),
                      Icon(
                        Icons.search,
                        color: onSurfaceVariant.withValues(alpha: 0.6),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const SearchScreen(),
                              ),
                            );
                          },
                          child: AbsorbPointer(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search plumber, electrician, fur...',
                                hintStyle: TextStyle(
                                  color: onSurfaceVariant.withValues(
                                    alpha: 0.6,
                                  ),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SearchScreen(),
                            ),
                          );
                        },
                        child: Container(
                          width: 48,
                          height: 48,
                          margin: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            Icons.tune,
                            color: Colors.white,
                            size: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // 4. CATEGORY GRID
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CategoryIcon(
                      icon: Icons.handyman,
                      label: 'Artisans',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SearchScreen(),
                          ),
                        );
                      },
                    ),
                    CategoryIcon(
                      icon: Icons.shopping_basket,
                      label: 'Markets & Food',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SearchScreen(),
                          ),
                        );
                      },
                    ),
                    CategoryIcon(
                      icon: Icons.home,
                      label: 'Housing',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SearchScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 48),

                // 5. SECTION HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Top Electricians near Wuse',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: onSurfaceColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const SearchScreen(),
                          ),
                        );
                      },
                      child: const Text(
                        'View all',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // 6. HORIZONTAL SCROLLING CARDS
                SizedBox(
                  height: 280,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.hardEdge,
                    children: [
                      ServiceCard(
                        name: "Musa's Quick Fix",
                        details: "Verified • 1.2km away",
                        price: "₦5,000 /hr",
                        rating: "4.9",
                        imageUrl: "assets/images/electrician.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ArtisanProfileScreen(),
                            ),
                          );
                        },
                      ),
                      const SizedBox(width: 16),
                      ServiceCard(
                        name: "Volt Master",
                        details: "Top Rated",
                        price: "₦7,500 /hr",
                        rating: "4.8",
                        imageUrl: "assets/images/electrician2.png",
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ArtisanProfileScreen(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),

                // ==========================================
                // 7. CORPER-FRIENDLY HOUSING SECTION
                // ==========================================
                const Text(
                  'Corper-Friendly Housing',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 16),

                // Hero Housing Card
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                        "https://images.unsplash.com/photo-1554995207-c18c203602cb?q=80&w=800&auto=format&fit=crop",
                      ), // You can swap this for AssetImage later
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black.withValues(alpha: 0.8),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        top: 16,
                        right: 16,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: secondaryColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const Text(
                            '₦250k/year',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 16,
                        left: 16,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'SELF-CONTAINED',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                color: Colors.white70,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Gwarimpa Estate, Phase II',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // Small Housing Cards Row
                Row(
                  children: [
                    Expanded(
                      child: _buildSmallHousingCard(
                        "Lugbe, Airport Rd",
                        "₦180k/year",
                        "https://images.unsplash.com/photo-1484154218962-a197022b5858?q=80&w=400&auto=format&fit=crop",
                        primaryColor,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildSmallHousingCard(
                        "Kubwa, Federal Housing",
                        "₦300k/year",
                        "https://images.unsplash.com/photo-1600585154340-be6161a56a0c?q=80&w=400&auto=format&fit=crop",
                        primaryColor,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // ==========================================
                // 8. CHEAP MARKETS THIS WEEK
                // ==========================================
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Cheap Markets This Week',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                      ),
                    ),
                    Icon(Icons.trending_down, color: primaryColor, size: 24),
                  ],
                ),
                const SizedBox(height: 16),

                // Market Cards Row
                Row(
                  children: [
                    Expanded(
                      child: _buildMarketCard(
                        "Utako Market",
                        "Best for Fresh Produce",
                        "-20% Off Fish",
                        Icons.eco,
                        secondaryColor,
                        primaryColor,
                        surfaceContainerLow,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildMarketCard(
                        "Wuse Market",
                        "Thrift Clothing Hub",
                        "-30% Jeans",
                        Icons.checkroom,
                        secondaryColor,
                        primaryColor,
                        surfaceContainerLow,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 48),

                // ==========================================
                // 9. SPONSORED ADVERTISEMENT
                // ==========================================
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: surfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFC4C7C5).withValues(alpha: 0.4),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'SPONSORED ADVERTISEMENT',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: onSurfaceVariant.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 8,
                                color: onSurfaceVariant.withValues(alpha: 0.1),
                              ),
                              const SizedBox(height: 6),
                              Container(
                                width: 60,
                                height: 8,
                                color: onSurfaceVariant.withValues(alpha: 0.1),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // PRIVATE HELPER: Small Housing Cards (Glassmorphism effect)
  // ---------------------------------------------------------------------------
  Widget _buildSmallHousingCard(
    String location,
    String price,
    String imageUrl,
    Color primaryColor,
  ) {
    return Container(
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(imageUrl), // Can swap to AssetImage later
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(16),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 8),
                color: Colors.white.withValues(alpha: 0.85),
                child: Column(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      location,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 9,
                        color: Color(0xFF191C1D),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ---------------------------------------------------------------------------
  // PRIVATE HELPER: Market Cards
  // ---------------------------------------------------------------------------
  Widget _buildMarketCard(
    String title,
    String subtitle,
    String discount,
    IconData icon,
    Color secondaryColor,
    Color primaryColor,
    Color surfaceLow,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
      decoration: BoxDecoration(
        color: surfaceLow,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: secondaryColor, size: 24),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF191C1D),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 10,
              color: Color(0xFF3D4A3E),
            ),
          ),
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              discount,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: FontWeight.w700,
                color: primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
