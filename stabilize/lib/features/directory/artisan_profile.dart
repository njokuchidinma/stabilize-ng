import 'package:flutter/material.dart';
import 'package:stabilize/features/directory/service_request.dart';
import 'package:stabilize/features/directory/chat.dart';

class ArtisanProfileScreen extends StatelessWidget {
  const ArtisanProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color secondaryColor = Color(0xFF8A5100); // Energetic Orange / Brown
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      // FIXED BOTTOM BAR FOR CTAs
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: onSurfaceColor.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            children: [
              // Secondary CTA (Ghost/Outline)
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: OutlinedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const ChatScreen()),
                      );
                    },
                    icon: const Icon(Icons.chat, color: primaryColor, size: 18),
                    label: const Text(
                      'Ask if they can\ndo it',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                        height: 1.2,
                      ),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(
                        color: primaryColor.withValues(alpha: 0.5),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              // Primary Action (Secondary Color - Orange)
              Expanded(
                child: SizedBox(
                  height: 56,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ServiceRequestScreen(),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.calendar_today,
                      color: Colors.white,
                      size: 18,
                    ),
                    label: const Text(
                      'Book Now',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: secondaryColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
              vertical: 16.0,
            ),
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centers header content
              children: [
                // 1. APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Row(
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
                    ),
                    const CircleAvatar(
                      radius: 18,
                      backgroundColor: surfaceContainerHigh,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=11',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 2. ARTISAN HEADER PROFILE
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: surfaceContainerHigh,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1540569014015-19a7be504e3a?q=80&w=200&auto=format&fit=crop',
                          ), // Placeholder
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: surfaceColor,
                            width: 2,
                          ), // Creates a cutout effect
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: Colors.white,
                              size: 12,
                            ),
                            SizedBox(width: 4),
                            Text(
                              'Verified',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                Text(
                  'Ahmed the Plumber',
                  style: const TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 8),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.star, color: secondaryColor, size: 16),
                    const SizedBox(width: 4),
                    Text(
                      '4.9 ',
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: onSurfaceColor,
                      ),
                    ),
                    Text(
                      '(128 Reviews)',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: onSurfaceVariant.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(
                      Icons.location_on,
                      color: onSurfaceColor,
                      size: 14,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Abuja',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: onSurfaceColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                // TAGS
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  alignment: WrapAlignment.center,
                  children: [
                    _buildTag(
                      'Pipe Fitting',
                      surfaceContainerHigh,
                      onSurfaceVariant,
                    ),
                    _buildTag(
                      'Leak Repair',
                      surfaceContainerHigh,
                      onSurfaceVariant,
                    ),
                    _buildTag(
                      'Emergency Callouts',
                      surfaceContainerHigh,
                      onSurfaceVariant,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 3. PRICE RANGE BOX
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Price Range',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              color: onSurfaceVariant.withValues(alpha: 0.8),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '₦5,000 - ₦50,000',
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 16,
                              fontWeight: FontWeight.w800,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Text(
                          'NEGOTIABLE',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.5,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // 4. WORK THEY HAVE DONE GALLERY
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Work They Have Done',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: onSurfaceColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Custom Masonry Grid Simulation
                Column(
                  children: [
                    // Large Top Image
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(
                        'https://images.unsplash.com/photo-1581094288338-2314dddb7ece?q=80&w=800&auto=format&fit=crop', // Pipes
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Row 1 of smaller images
                    Row(
                      children: [
                        Expanded(
                          child: _buildGridImage(
                            'https://images.unsplash.com/photo-1607472586893-edb57cb641a7?q=80&w=400&auto=format&fit=crop',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildGridImage(
                            'https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=400&auto=format&fit=crop',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Row 2 of smaller images
                    Row(
                      children: [
                        Expanded(
                          child: _buildGridImage(
                            'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=400&auto=format&fit=crop',
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: _buildGridImage(
                            'https://images.unsplash.com/photo-1527018263374-5adb6a54da5e?q=80&w=400&auto=format&fit=crop',
                          ),
                        ), // Water tank
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // 5. WHAT CAN BE REPLICATED (Horizontal Scroll)
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What Can Be Replicated',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: onSurfaceColor,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    clipBehavior: Clip.none,
                    children: [
                      _buildReplicatedCard(
                        'Water Tank Installation',
                        '₦25,000',
                        'https://images.unsplash.com/photo-1527018263374-5adb6a54da5e?q=80&w=400&auto=format&fit=crop',
                        primaryColor,
                      ),
                      const SizedBox(width: 16),
                      _buildReplicatedCard(
                        'Tile Repair',
                        '₦45,000',
                        'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=400&auto=format&fit=crop',
                        primaryColor,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // 6. RECENT REVIEWS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Recent Reviews',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 18,
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('All reviews coming soon'),
                          ),
                        );
                      },
                      child: const Text(
                        'View All',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildReview(
                  'Chidi Okechukwu',
                  '2 days ago',
                  'Very fast and professional! Highly recommended for new movers. He fixed my kitchen leak in 30 minutes.',
                  'https://i.pravatar.cc/150?img=12',
                ),
                _buildReview(
                  'Aisha Mohammed',
                  '1 week ago',
                  'Ahmed is my go-to guy for anything plumbing. He is polite and doesn\'t overcharge. He did my tank installation perfectly.',
                  'https://i.pravatar.cc/150?img=5',
                ),
                _buildReview(
                  'Tunde Bakare',
                  '2 weeks ago',
                  'Excellent craftsmanship. His tiling work in my master bathroom looks like it was done by a luxury contractor.',
                  'https://i.pravatar.cc/150?img=60',
                ),

                const SizedBox(height: 24), // Extra padding for the bottom bar
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- PRIVATE HELPERS BELOW ---

  Widget _buildTag(String label, Color bgColor, Color textColor) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildGridImage(String url) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.network(
        url,
        height: 120,
        width: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildReplicatedCard(
    String title,
    String price,
    String url,
    Color primaryColor,
  ) {
    return Container(
      width: 160,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
            child: Image.network(
              url,
              height: 100,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF191C1D),
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReview(String name, String time, String text, String avatarUrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(radius: 20, backgroundImage: NetworkImage(avatarUrl)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF191C1D),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  text,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: Color(0xFF3D4A3E),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                // 5 Stars
                Row(
                  children: List.generate(
                    5,
                    (index) => const Icon(
                      Icons.star,
                      color: Color(0xFF8A5100),
                      size: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
