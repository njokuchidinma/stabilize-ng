import 'package:flutter/material.dart';

class BookingHistoryScreen extends StatefulWidget {
  const BookingHistoryScreen({super.key});

  @override
  State<BookingHistoryScreen> createState() => _BookingHistoryScreenState();
}

class _BookingHistoryScreenState extends State<BookingHistoryScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Completed', 'Upcoming', 'Cancelled'];

  final List<Map<String, dynamic>> _bookings = [
    {
      'name': 'Emeka Johnson',
      'service': 'Electrical Wiring',
      'price': '₦15,000',
      'date': 'Mar 28, 2026',
      'time': '10:00 AM',
      'status': 'Completed',
      'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?q=80&w=100&auto=format&fit=crop',
    },
    {
      'name': 'Blessing Okafor',
      'service': 'Plumbing Repair',
      'price': '₦8,500',
      'date': 'Mar 20, 2026',
      'time': '2:30 PM',
      'status': 'Completed',
      'avatar': 'https://images.unsplash.com/photo-1494790108377-be9c29b29330?q=80&w=100&auto=format&fit=crop',
    },
    {
      'name': 'Chidi Nwosu',
      'service': 'Painting',
      'price': '₦25,000',
      'date': 'Apr 5, 2026',
      'time': '9:00 AM',
      'status': 'Upcoming',
      'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?q=80&w=100&auto=format&fit=crop',
    },
    {
      'name': 'Ada Obi',
      'service': 'Cleaning Service',
      'price': '₦5,000',
      'date': 'Mar 10, 2026',
      'time': '11:00 AM',
      'status': 'Cancelled',
      'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?q=80&w=100&auto=format&fit=crop',
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color secondaryColor = Color(0xFF8A5100);

    final filteredBookings = _selectedFilter == 0
        ? _bookings
        : _bookings.where((b) => b['status'] == _filters[_selectedFilter]).toList();

    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // APP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: primaryColor),
                  ),
                  const SizedBox(width: 16),
                  const Text(
                    'Booking History',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            // FILTER CHIPS
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: _filters.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final isSelected = _selectedFilter == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedFilter = index),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? primaryColor : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: isSelected ? primaryColor : surfaceContainerHigh,
                        ),
                      ),
                      child: Text(
                        _filters[index],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: isSelected ? Colors.white : onSurfaceVariant,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Results count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                '${filteredBookings.length} booking${filteredBookings.length != 1 ? 's' : ''}',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: onSurfaceVariant.withValues(alpha: 0.7),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // BOOKING CARDS
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                itemCount: filteredBookings.length,
                separatorBuilder: (_, _) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final booking = filteredBookings[index];
                  return _buildBookingCard(
                    booking,
                    primaryColor,
                    secondaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  );
                },
              ),
            ),
          ],
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
  ) {
    Color statusColor;
    Color statusBg;
    switch (booking['status']) {
      case 'Completed':
        statusColor = primaryColor;
        statusBg = primaryColor.withValues(alpha: 0.1);
        break;
      case 'Upcoming':
        statusColor = secondaryColor;
        statusBg = secondaryColor.withValues(alpha: 0.1);
        break;
      case 'Cancelled':
        statusColor = const Color(0xFFD32F2F);
        statusBg = const Color(0xFFD32F2F).withValues(alpha: 0.1);
        break;
      default:
        statusColor = onSurfaceVariant;
        statusBg = onSurfaceVariant.withValues(alpha: 0.1);
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(booking['avatar']),
          ),
          const SizedBox(width: 14),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      booking['name'],
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: onSurfaceColor,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: statusBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        booking['status'],
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
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
                    fontSize: 13,
                    color: onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(Icons.calendar_today, size: 12, color: onSurfaceVariant.withValues(alpha: 0.5)),
                    const SizedBox(width: 4),
                    Text(
                      '${booking['date']} • ${booking['time']}',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: onSurfaceVariant.withValues(alpha: 0.6),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      booking['price'],
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
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
        ],
      ),
    );
  }
}
