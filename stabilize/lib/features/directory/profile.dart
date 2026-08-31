import 'package:flutter/material.dart';
import 'package:stabilize/features/directory/profile/personal_info.dart';
import 'package:stabilize/features/directory/profile/booking_history.dart';
import 'package:stabilize/features/directory/profile/favorite_artisans.dart';
import 'package:stabilize/features/directory/profile/saved_markets.dart';
import 'package:stabilize/features/directory/profile/notifications_settings.dart';
import 'package:stabilize/features/directory/profile/identity_status_modal.dart';
import 'package:stabilize/features/directory/profile/linked_bank_modal.dart';
import 'package:stabilize/features/directory/profile/security_modal.dart';
import 'package:stabilize/features/directory/profile/support_modal.dart';
import 'package:stabilize/features/directory/profile/sign_out_modal.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      // No BottomNavigationBar here! MainLayout will handle it.
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // 1. APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.arrow_back, color: primaryColor),
                        const SizedBox(width: 16),
                        const Text(
                          'Profile',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Icon(Icons.more_vert, color: onSurfaceVariant),
                  ],
                ),
                const SizedBox(height: 32),

                // 2. PROFILE HEADER
                Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(4), // White border effect
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundImage: NetworkImage('https://images.unsplash.com/photo-1506277886164-e25aa3f4ef7f?q=80&w=200&auto=format&fit=crop'), // Placeholder Avatar
                      ),
                    ),
                    // Verified Badge
                    Positioned(
                      bottom: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                        child: const Icon(Icons.verified, color: Colors.white, size: 14),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                const Text(
                  'Frank – Abuja',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'frank.corpers@email.com',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: onSurfaceVariant.withValues(alpha: 0.8),
                  ),
                ),
                const SizedBox(height: 12),

                // Identity Verified Pill
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: primaryColor.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.shield, color: primaryColor, size: 12),
                      const SizedBox(width: 6),
                      const Text(
                        'IDENTITY VERIFIED',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // 3. STATS ROW
                Row(
                  children: [
                    Expanded(child: _buildStatCard('5', 'BOOKINGS', primaryColor)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildStatCard('2', 'REVIEWS', primaryColor)),
                    const SizedBox(width: 12),
                    Expanded(child: _buildStatCard('A+', 'RELIABILITY', const Color(0xFF8A5100))),
                  ],
                ),
                const SizedBox(height: 40),

                // 4. MY ACCOUNT SECTION
                _buildSectionHeader('MY ACCOUNT'),
                _buildCardGroup([
                  _buildListTile(Icons.person, 'Personal Information', 'Update your bio and details', onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const PersonalInfoScreen()));
                  }),
                  _buildListTile(Icons.verified_user, 'Identity Verification', 'COMPLETED', isCompleted: true, onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const IdentityStatusModal(),
                    );
                  }),
                  _buildListTile(Icons.account_balance, 'Linked Bank Account', 'GTBank **** 5590', onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const LinkedBankModal(),
                    );
                  }),
                ]),
                const SizedBox(height: 32),

                // 5. MY ACTIVITY SECTION
                _buildSectionHeader('MY ACTIVITY'),
                _buildCardGroup([
                  _buildListTile(Icons.receipt_long, 'Booking History', null, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const BookingHistoryScreen()));
                  }),
                  _buildListTile(Icons.star, 'Favorite Artisans', null, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const FavoriteArtisansScreen()));
                  }),
                  _buildListTile(Icons.storefront, 'Saved Markets', null, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const SavedMarketsScreen()));
                  }),
                ]),
                const SizedBox(height: 32),

                // 6. SETTINGS SECTION
                _buildSectionHeader('SETTINGS'),
                _buildCardGroup([
                  _buildListTile(Icons.notifications, 'Notifications', null, hasNotification: true, onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationsSettingsScreen()));
                  }),
                  _buildListTile(Icons.security, 'Security', null, onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const SecurityModal(),
                    );
                  }),
                  _buildListTile(Icons.support_agent, 'Support', null, onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) => const SupportModal(),
                    );
                  }),
                ]),
                const SizedBox(height: 40),

                // 7. SIGN OUT BUTTON
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0F0), // Soft Red/Pink background
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: TextButton(
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        builder: (_) => const SignOutModal(),
                      );
                    },
                    child: const Text(
                      'Sign Out',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFD32F2F), // Red text
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 48), // Padding for bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- PRIVATE HELPERS ---

  Widget _buildStatCard(String value, String label, Color valueColor) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000), // 4% Opacity ambient shadow
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            value,
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: valueColor,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 9,
              fontWeight: FontWeight.w700,
              color: Color(0xFF3D4A3E),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12.0, left: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontFamily: 'Inter',
            fontSize: 10,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.5,
            color: Color(0xFF3D4A3E),
          ),
        ),
      ),
    );
  }

  Widget _buildCardGroup(List<Widget> children) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildListTile(IconData icon, String title, String? subtitle, {bool isCompleted = false, bool hasNotification = false, VoidCallback? onTap}) {
    const Color primaryColor = Color(0xFF006B32);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        children: [
          // Icon Box
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F5), // surfaceContainerLow
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryColor, size: 20),
          ),
          const SizedBox(width: 16),

          // Text Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF191C1D),
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  if (isCompleted)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: primaryColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        subtitle,
                        style: const TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                    )
                  else
                    Text(
                      subtitle,
                      style: const TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: Color(0xFF3D4A3E),
                      ),
                    ),
                ],
              ],
            ),
          ),

          // Trailing Elements
          if (hasNotification)
            Container(
              width: 8,
              height: 8,
              margin: const EdgeInsets.only(right: 8),
              decoration: const BoxDecoration(
                color: Color(0xFF8A5100), // Orange dot
                shape: BoxShape.circle,
              ),
            ),
          const Icon(Icons.chevron_right, color: Color(0xFFC4C7C5), size: 20),
        ],
      ),
      ),
    );
  }
}