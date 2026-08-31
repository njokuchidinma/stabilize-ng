import 'package:flutter/material.dart';

class WorkforceMessagesScreen extends StatelessWidget {
  const WorkforceMessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot" design system
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      // No Bottom Nav here! This is a pushed screen.
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. APP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child: const Icon(Icons.arrow_back, color: primaryColor),
                      ),
                      const SizedBox(width: 16),
                      const Text(
                        'Enquiries',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const Icon(Icons.more_vert, color: onSurfaceVariant),
                ],
              ),
            ),

            // Use Expanded to make the rest of the screen scrollable
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 16),

                    // 2. HEADER
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          'Recent Chats',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 32,
                            fontWeight: FontWeight.w800,
                            color: onSurfaceColor,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 6.0),
                          child: Text(
                            'ABUJA DISTRICT',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              letterSpacing: 1.5,
                              color: primaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 24),

                    // 3. SEARCH BAR
                    Container(
                      height: 48,
                      decoration: BoxDecoration(
                        color: surfaceContainerHigh.withValues(alpha: 0.5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 16),
                          Icon(Icons.search, color: onSurfaceVariant.withValues(alpha: 0.5), size: 20),
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: 'Search customers...',
                                hintStyle: TextStyle(
                                  color: onSurfaceVariant.withValues(alpha: 0.5),
                                  fontFamily: 'Inter',
                                  fontSize: 14,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),

                    // 4. CHAT LIST
                    _buildChatCard(
                      name: 'Corper Jane',
                      message: 'Can you fix the sink at 2 ...',
                      time: '2:14 PM',
                      unreadCount: 1,
                      isOnline: true,
                      avatarUrl: 'https://i.pravatar.cc/150?img=44', // Placeholder image
                    ),
                    const SizedBox(height: 16),
                    
                    _buildChatCard(
                      name: 'Corper Musa',
                      message: 'The wiring in the kitchen is working ...',
                      time: '11:05 AM',
                      unreadCount: 0,
                      isOnline: false,
                      avatarUrl: 'https://i.pravatar.cc/150?img=11',
                    ),
                    const SizedBox(height: 16),
                    
                    _buildChatCard(
                      name: 'Corper Amaka',
                      message: 'Sent a photo of the leakin...',
                      time: 'YESTERDAY',
                      unreadCount: 3,
                      isOnline: false,
                      avatarUrl: 'https://i.pravatar.cc/150?img=5',
                    ),
                    const SizedBox(height: 16),
                    
                    _buildChatCard(
                      name: 'Corper Blessing T.',
                      message: "I'll recommend you to my fellow corp...",
                      time: 'OCT 24',
                      unreadCount: 0,
                      isOnline: false,
                      avatarUrl: '', // Empty URL triggers the initials avatar
                      initials: 'BT',
                    ),
                    const SizedBox(height: 16),

                    _buildChatCard(
                      name: 'Corper Emeka',
                      message: 'Is the generator repair still 5,000 Nai...',
                      time: 'OCT 22',
                      unreadCount: 0,
                      isOnline: false,
                      avatarUrl: 'https://i.pravatar.cc/150?img=12',
                    ),
                    const SizedBox(height: 32),

                    // 5. BOTTOM PROMO BANNER
                    _buildPromoBanner(),
                    const SizedBox(height: 48), // Bottom padding
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- PRIVATE HELPER: CHAT CARD ---
  Widget _buildChatCard({
    required String name,
    required String message,
    required String time,
    required int unreadCount,
    required bool isOnline,
    required String avatarUrl,
    String initials = '',
  }) {
    final bool hasUnread = unreadCount > 0;
    const Color primaryColor = Color(0xFF006B32);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000), // Very light shadow
            blurRadius: 20,
            offset: Offset(0, 4),
          )
        ],
      ),
      // We use ClipRRect so the left border curves beautifully with the container
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Container(
          decoration: BoxDecoration(
            // Adds the green accent line on the left if there are unread messages
            border: hasUnread 
                ? const Border(left: BorderSide(color: primaryColor, width: 4)) 
                : const Border(left: BorderSide(color: Colors.transparent, width: 4)),
          ),
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              // Avatar Section
              Stack(
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: avatarUrl.isEmpty ? primaryColor : Colors.transparent,
                    backgroundImage: avatarUrl.isNotEmpty ? NetworkImage(avatarUrl) : null,
                    child: avatarUrl.isEmpty
                        ? Text(
                            initials,
                            style: const TextStyle(
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          )
                        : null,
                  ),
                  if (isOnline)
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 14,
                        height: 14,
                        decoration: BoxDecoration(
                          color: const Color(0xFF22C55E), // Online green
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 16),
              
              // Text Content Section
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            name,
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontSize: 16,
                              fontWeight: hasUnread ? FontWeight.w800 : FontWeight.w600,
                              color: onSurfaceColor,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 10,
                            fontWeight: hasUnread ? FontWeight.w700 : FontWeight.w500,
                            color: hasUnread ? primaryColor : onSurfaceVariant.withValues(alpha: 0.5),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            message,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 13,
                              fontWeight: hasUnread ? FontWeight.w600 : FontWeight.w400,
                              color: hasUnread ? onSurfaceColor : onSurfaceVariant.withValues(alpha: 0.8),
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (hasUnread)
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: primaryColor,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              unreadCount.toString(),
                              style: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
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
        ),
      ),
    );
  }

  // --- PRIVATE HELPER: PROMO BANNER ---
  Widget _buildPromoBanner() {
    const Color primaryColor = Color(0xFF006B32);
    const Color actionOrange = Color(0xFFF59E0B); // Action Orange

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.location_on, color: Colors.white, size: 14),
              const SizedBox(width: 8),
              Text(
                'SERVING ABUJA CENTRAL',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            'You have 4 potential bookings from customers in Gwarinpa today.',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              height: 1.3,
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // White Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: primaryColor,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'View Request Map',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              // Floating Action Button Style (Orange)
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  color: actionOrange,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: const Icon(Icons.edit_note, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}