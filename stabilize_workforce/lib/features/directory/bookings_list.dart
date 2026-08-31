import 'package:flutter/material.dart';
import 'package:stabilize_workforce/features/directory/booking_detail.dart';
import 'package:stabilize_workforce/features/directory/rate_client.dart';

class WorkforceBookingsListScreen extends StatefulWidget {
  const WorkforceBookingsListScreen({super.key});

  @override
  State<WorkforceBookingsListScreen> createState() => _WorkforceBookingsListScreenState();
}

class _WorkforceBookingsListScreenState extends State<WorkforceBookingsListScreen> {
  int _selectedFilter = 0;
  final List<String> _filters = ['All', 'Upcoming', 'Completed', 'Cancelled'];

  final List<Map<String, dynamic>> _bookings = [
    {
      'clientName': 'Frank – Abuja',
      'clientInitials': 'F',
      'service': 'Repairing Wardrobe – Maitama',
      'date': 'Oct 10, 10:00 AM',
      'budget': '₦12,500',
      'status': 'Upcoming',
      'avatarColor': Color(0xFF006B32),
    },
    {
      'clientName': 'Chidi Okafor',
      'clientInitials': 'CO',
      'service': 'Kitchen Sink Repair – Lagos Island',
      'date': 'Oct 8, 2:00 PM',
      'budget': '₦25,000',
      'status': 'Completed',
      'avatarColor': Color(0xFFD4E6D9),
    },
    {
      'clientName': 'Amina Abubakar',
      'clientInitials': 'AA',
      'service': 'Drainage Fix – Surulere',
      'date': 'Oct 5, 11:00 AM',
      'budget': '₦18,000',
      'status': 'Completed',
      'avatarColor': Color(0xFFEEDDCC),
    },
    {
      'clientName': 'Tunde Williams',
      'clientInitials': 'TW',
      'service': 'Pipe Installation – Wuse',
      'date': 'Oct 3, 9:00 AM',
      'budget': '₦35,000',
      'status': 'Cancelled',
      'avatarColor': Color(0xFFE7E8E9),
    },
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);
    const Color secondaryColor = Color(0xFF8A5100);

    final filtered = _selectedFilter == 0
        ? _bookings
        : _bookings.where((b) => b['status'] == _filters[_selectedFilter]).toList();

    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(
                            color: Color(0xFF192A32),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(Icons.handyman, color: Colors.white, size: 16),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Bookings',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.notifications, color: onSurfaceVariant, size: 24),
                  ],
                ),
                const SizedBox(height: 24),

                // HEADER
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
                  '${_bookings.length} total bookings',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    color: onSurfaceVariant.withValues(alpha: 0.7),
                  ),
                ),
                const SizedBox(height: 20),

                // FILTER CHIPS
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

                // BOOKING LIST
                if (filtered.isEmpty)
                  _buildEmptyState(primaryColor, onSurfaceVariant)
                else
                  ...filtered.map((booking) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (_) => const WorkforceBookingDetailScreen()),
                          );
                        },
                        child: _buildBookingCard(
                          booking,
                          primaryColor,
                          secondaryColor,
                          onSurfaceColor,
                          onSurfaceVariant,
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
      child: Column(
        children: [
          Row(
            children: [
              // Client Avatar
              CircleAvatar(
                radius: 24,
                backgroundColor: booking['avatarColor'],
                child: Text(
                  booking['clientInitials'],
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: booking['avatarColor'] == const Color(0xFF006B32) 
                        ? Colors.white 
                        : onSurfaceColor,
                  ),
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
                            booking['clientName'],
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
                            status,
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
                        color: onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.calendar_today, size: 12, color: onSurfaceVariant.withValues(alpha: 0.7)),
                            const SizedBox(width: 4),
                            Text(
                              booking['date'],
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                color: onSurfaceVariant.withValues(alpha: 0.8),
                              ),
                            ),
                          ],
                        ),
                        Text(
                          booking['budget'],
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 14,
                            fontWeight: FontWeight.w800,
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
          // Rate Client CTA for completed bookings
          if (status == 'Completed') ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: OutlinedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => RateClientScreen(
                        clientName: booking['clientName'],
                        clientInitials: booking['clientInitials'],
                        service: booking['service'],
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.star_border, size: 16),
                label: const Text(
                  'Rate Client',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                style: OutlinedButton.styleFrom(
                  foregroundColor: primaryColor,
                  side: BorderSide(color: primaryColor.withValues(alpha: 0.3)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildEmptyState(Color primaryColor, Color onSurfaceVariant) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 48),
        child: Column(
          children: [
            Icon(Icons.calendar_today, size: 48, color: primaryColor.withValues(alpha: 0.3)),
            const SizedBox(height: 16),
            Text(
              'No bookings found',
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Bookings will appear here when\nclients book your services.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 13,
                color: onSurfaceVariant.withValues(alpha: 0.7),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
