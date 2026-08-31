import 'package:flutter/material.dart';
import 'package:stabilize/features/directory/search.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Upcoming', 'Completed', 'Cancelled'];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);
    const Color secondaryColor = Color(0xFF8A5100);

    final List<Map<String, dynamic>> bookings = [
      {
        'name': 'Ahmed the Plumber',
        'service': 'Kitchen Pipe Repair',
        'date': 'Apr 3, 2:00 PM',
        'price': '₦25,000',
        'status': 'Upcoming',
        'imageUrl': 'https://i.pravatar.cc/150?img=11',
      },
      {
        'name': 'Emeka Johnson',
        'service': 'Electrical Wiring',
        'date': 'Mar 28, 10:00 AM',
        'price': '₦15,000',
        'status': 'Completed',
        'imageUrl': 'https://i.pravatar.cc/150?img=12',
      },
      {
        'name': 'Blessing Okafor',
        'service': 'Plumbing Repair',
        'date': 'Mar 20, 2:30 PM',
        'price': '₦8,500',
        'status': 'Completed',
        'imageUrl': 'https://i.pravatar.cc/150?img=5',
      },
    ];

    final filtered = _selectedFilter == 0
        ? bookings
        : bookings.where((b) => b['status'] == _filters[_selectedFilter]).toList();

    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, color: primaryColor, size: 20),
                        const SizedBox(width: 16),
                        const Text(
                          'Bookings',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 20,
                            fontWeight: FontWeight.w800,
                            color: primaryColor,
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

                // Header
                const Text(
                  'Your Bookings',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '${bookings.length} total bookings',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 20),

                // Filter chips
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(_filters.length, (index) {
                      final isSelected = _selectedFilter == index;
                      return Padding(
                        padding: EdgeInsets.only(right: index < _filters.length - 1 ? 10 : 0),
                        child: GestureDetector(
                          onTap: () => setState(() => _selectedFilter = index),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                            decoration: BoxDecoration(
                              color: isSelected ? primaryColor : Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: isSelected
                                  ? null
                                  : Border.all(color: outlineVariant.withValues(alpha: 0.4)),
                            ),
                            child: Text(
                              _filters[index],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected ? Colors.white : onSurfaceColor,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                const SizedBox(height: 24),

                // Booking list
                if (filtered.isEmpty)
                  _buildEmptyState(primaryColor, onSurfaceColor, onSurfaceVariant)
                else
                  ...filtered.map((booking) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Viewing booking: ${booking['name']}')),
                          );
                        },
                        child: _buildBookingCard(
                          booking,
                          primaryColor,
                          secondaryColor,
                          onSurfaceColor,
                          onSurfaceVariant,
                          surfaceColor,
                        ),
                      ),
                    );
                  }),

                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBookingCard(
    Map<String, dynamic> booking,
    Color primaryColor,
    Color secondaryColor,
    Color onSurfaceColor,
    Color onSurfaceVariant,
    Color surfaceColor,
  ) {
    final String status = booking['status'];
    final Color statusColor = status == 'Upcoming'
        ? secondaryColor
        : status == 'Completed'
            ? primaryColor
            : const Color(0xFFD32F2F);
    final Color statusBg = statusColor.withValues(alpha: 0.1);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: onSurfaceColor.withValues(alpha: 0.04),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              booking['imageUrl'],
              width: 56,
              height: 56,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 14),

          // Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        booking['name'],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: onSurfaceColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        status.toUpperCase(),
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: statusColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  booking['service'],
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 14, color: onSurfaceVariant.withValues(alpha: 0.5)),
                        const SizedBox(width: 4),
                        Text(
                          booking['date'],
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 11,
                            color: onSurfaceVariant.withValues(alpha: 0.6),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      booking['price'],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(width: 8),
          Icon(Icons.chevron_right, color: onSurfaceVariant.withValues(alpha: 0.3), size: 20),
        ],
      ),
    );
  }

  Widget _buildEmptyState(Color primaryColor, Color onSurface, Color variant) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 60),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.08),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.calendar_today, color: primaryColor, size: 40),
            ),
            const SizedBox(height: 20),
            Text(
              'No bookings yet',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: onSurface,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Find skilled artisans and book your\nfirst service today',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: variant.withValues(alpha: 0.6),
                height: 1.5,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const SearchScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                elevation: 0,
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Find Artisans',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}