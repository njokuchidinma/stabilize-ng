import 'package:flutter/material.dart';
import 'package:stabilize/features/directory/artisan_profile.dart';
import 'package:stabilize/features/directory/service_request.dart';
import 'package:stabilize/features/directory/chat.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['Distance', 'Price Range', 'Rating'];

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerLow = Color(0xFFF3F4F5);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);

    return Scaffold(
      backgroundColor: surfaceColor,
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
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(
                            Icons.arrow_back,
                            color: primaryColor,
                          ),
                        ),
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
                const SizedBox(height: 24),

                // 2. SEARCH INPUT BAR
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
                        color: onSurfaceVariant.withValues(alpha: 0.8),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: TextField(
                          controller: TextEditingController(
                            text: 'Electricians',
                          ),
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: onSurfaceColor,
                            fontWeight: FontWeight.w500,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      const Icon(Icons.tune, color: primaryColor),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                // 3. HORIZONTAL FILTER CHIPS
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(_filters.length, (index) {
                      final isSelected = _selectedFilter == index;
                      return Padding(
                        padding: EdgeInsets.only(
                          right: index < _filters.length - 1 ? 12 : 0,
                        ),
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedFilter = index),
                          child: isSelected
                              ? _buildActiveFilterChip(
                                  _filters[index],
                                  primaryColor,
                                )
                              : _buildInactiveFilterChip(
                                  _filters[index],
                                  outlineVariant,
                                  onSurfaceColor,
                                ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 32),

                // 4. HEADER SECTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Artisans Near You',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: onSurfaceColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Found 24 professionals in Lagos',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: onSurfaceVariant.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.sort, color: primaryColor),
                  ],
                ),
                const SizedBox(height: 24),

                // 5. SEARCH RESULTS LIST
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ArtisanProfileScreen(),
                      ),
                    );
                  },
                  child: _SearchResultCard(
                    name: 'Ahmed the Plumber',
                    price: '₦5,000+',
                    location: '2.5km away • Ikeja, Lagos',
                    rating: '4.8',
                    imageUrl:
                        'https://images.unsplash.com/photo-1540569014015-19a7be504e3a?q=80&w=600&auto=format&fit=crop',
                  ),
                ),
                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ArtisanProfileScreen(),
                      ),
                    );
                  },
                  child: _SearchResultCard(
                    name: 'Mama Ngozi Furniture',
                    price: '₦15,000+',
                    location: '3.1km away • Maryland, Lagos',
                    rating: '4.9',
                    imageUrl:
                        'https://images.unsplash.com/photo-1538688525198-9b88f6f53126?q=80&w=600&auto=format&fit=crop',
                  ),
                ),
                const SizedBox(height: 32),

                // 6. ADVERTISEMENT BANNER
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: surfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'ADVERTISEMENT',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.5,
                          color: onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 12),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          // Ghost border for the ad
                          border: Border.all(
                            color: outlineVariant.withValues(alpha: 0.3),
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'Upgrade to Premium for No Ads',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 48), // Padding for the bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Helper for Green Active Filter
  Widget _buildActiveFilterChip(String label, Color primaryColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 6),
          const Icon(Icons.keyboard_arrow_down, color: Colors.white, size: 16),
        ],
      ),
    );
  }

  // Helper for White Inactive Filter
  Widget _buildInactiveFilterChip(
    String label,
    Color outlineVariant,
    Color onSurfaceColor,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: outlineVariant.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: onSurfaceColor,
            ),
          ),
          const SizedBox(width: 6),
          Icon(Icons.keyboard_arrow_down, color: onSurfaceColor, size: 16),
        ],
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PRIVATE HELPER: Large Search Result Card
// -----------------------------------------------------------------------------
class _SearchResultCard extends StatelessWidget {
  final String name;
  final String price;
  final String location;
  final String rating;
  final String imageUrl;

  const _SearchResultCard({
    required this.name,
    required this.price,
    required this.location,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: onSurfaceColor.withValues(alpha: 0.04),
            blurRadius: 24,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // IMAGE & RATING
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Image.network(
                  imageUrl, // You can switch this to AssetImage later
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                left: 12, // Moved to the left based on your design
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xFF8A5100),
                        size: 14,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        rating,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // DETAILS
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Name and Price Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        name,
                        style: const TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 16,
                          fontWeight: FontWeight.w800,
                          color: onSurfaceColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      price,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),

                // Location Row
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: Color(0xFF3D4A3E),
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      location,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: Color(0xFF3D4A3E),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Tags Row
                Row(
                  children: [
                    _buildTag('CORPER-FRIENDLY', primaryColor),
                    const SizedBox(width: 8),
                    _buildTag('FAST RESPONSE', const Color(0xFF8A5100)),
                  ],
                ),
                const SizedBox(height: 16),

                // Buttons Row
                Row(
                  children: [
                    // Primary Book Now Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const ServiceRequestScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: const Text(
                          'Book Now',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Secondary Message Button
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const ChatScreen()),
                        );
                      },
                      child: Container(
                        height: 48,
                        width: 48,
                        decoration: BoxDecoration(
                          color: surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(
                          Icons.chat,
                          color: onSurfaceColor,
                          size: 20,
                        ),
                      ),
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

  // Helper for the small colored tags
  Widget _buildTag(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1), // 10% opacity background
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 9,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}
