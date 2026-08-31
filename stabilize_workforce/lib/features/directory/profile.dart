import 'package:flutter/material.dart';
import 'package:stabilize_workforce/features/directory/profile/personal_info.dart';
import 'package:stabilize_workforce/features/directory/profile/availability_location.dart';
import 'package:stabilize_workforce/features/directory/profile/identity_status_modal.dart';
import 'package:stabilize_workforce/features/directory/profile/linked_bank_modal.dart';
import 'package:stabilize_workforce/features/directory/profile/security_modal.dart';
import 'package:stabilize_workforce/features/directory/profile/notifications_settings.dart';
import 'package:stabilize_workforce/features/directory/profile/support_modal.dart';
import 'package:stabilize_workforce/features/directory/profile/sign_out_modal.dart';

class WorkforceProfileScreen extends StatelessWidget {
  const WorkforceProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot" design system
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);

    return Scaffold(
      backgroundColor: surfaceColor,
      // Bottom Navigation handled by WorkforceMainLayout
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
                // 1. APP BAR
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/logo.png',
                          width: 32,
                          height: 32,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'My Profile',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                    const Icon(
                      Icons.notifications,
                      color: primaryColor,
                      size: 24,
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // 2. HERO PROFILE CARD
                Stack(
                  children: [
                    // Top Dark Section
                    Container(
                      height: 140,
                      decoration: BoxDecoration(
                        color: const Color(0xFF191C1D),
                        borderRadius: BorderRadius.circular(24),
                      ),
                    ),
                    // Edit Button floating on the dark section
                    Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.2),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.edit,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                    ),
                    // Overlapping White Info Card
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24),
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
                            const Text(
                              'Ahmed the Plumber',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 22,
                                fontWeight: FontWeight.w800,
                                color: onSurfaceColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Plumbing & Drainage',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                color: onSurfaceVariant.withValues(alpha: 0.9),
                              ),
                            ),
                            const SizedBox(height: 24),

                            // Service Fee Header
                            const Text(
                              'SERVICE FEE',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1.5,
                                color: onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              '₦5,000 - ₦50,000',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 16),

                            // Negotiable Toggle Badge
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(
                                  0xFFF3F4F5,
                                ), // surfaceContainerLow
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Negotiable',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: onSurfaceColor,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  // Custom visual match for the active switch
                                  Container(
                                    width: 40,
                                    height: 22,
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Container(
                                        margin: const EdgeInsets.all(2),
                                        width: 18,
                                        height: 18,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                          shape: BoxShape.circle,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // 3. CORPER-FRIENDLY BADGE SECTION
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF1F8F4), // Light green tint
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.verified_user,
                        color: primaryColor,
                        size: 28,
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Corper-friendly Badge',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: onSurfaceColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Offering discounts for National\nYouth Service Corps members',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                color: onSurfaceVariant.withValues(alpha: 0.8),
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Radio Button Outline
                      Container(
                        width: 24,
                        height: 24,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: primaryColor, width: 2.5),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),

                // 4. WORK PORTFOLIO
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Work Portfolio',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                      ),
                    ),
                    Row(
                      children: const [
                        Text(
                          'View all',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                        SizedBox(width: 4),
                        Icon(
                          Icons.arrow_forward,
                          color: primaryColor,
                          size: 14,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    _buildPortfolioImage(
                      'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=200&auto=format&fit=crop',
                    ),
                    const SizedBox(width: 12),
                    _buildPortfolioImage(
                      'https://images.unsplash.com/photo-1581094288338-2314dddb7ece?q=80&w=200&auto=format&fit=crop',
                    ),
                    const SizedBox(width: 12),
                    // "Add Work" Ghost Card
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: outlineVariant.withValues(alpha: 0.6),
                          width: 1.5,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: onSurfaceVariant,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'ADD WORK',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 9,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.0,
                              color: onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),

                // 5. WHAT I CAN REPLICATE
                const Text(
                  'What I Can Replicate',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 16),

                _buildReplicateCard(
                  'Modern Sink Install',
                  '₦15,000',
                  'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=200&auto=format&fit=crop',
                  primaryColor,
                  onSurfaceColor,
                ),
                const SizedBox(height: 12),
                _buildReplicateCard(
                  'Heater Servicing',
                  '₦8,500',
                  'https://images.unsplash.com/photo-1556910103-1c02745aae4d?q=80&w=200&auto=format&fit=crop',
                  primaryColor,
                  onSurfaceColor,
                ),
                const SizedBox(height: 40),

                // 6. CLIENT REVIEWS
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Client Reviews',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                      ),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.star, color: Color(0xFF8A5100), size: 18),
                        SizedBox(width: 4),
                        Text(
                          '4.9',
                          style: TextStyle(
                            fontFamily: 'PlusJakartaSans',
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF8A5100), // Brown star color
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildReviewCard(
                  'CO',
                  'Chidi Okafor',
                  'Lagos Island • 2 days ago',
                  'Ahmed is very professional. He fixed my kitchen sink leak in under 30 minutes and even cleaned up the work area. Highly recommended!',
                  const Color(0xFFD4E6D9), // Light green avatar background
                  primaryColor,
                ),
                const SizedBox(height: 16),
                _buildReviewCard(
                  'AA',
                  'Amina Abubakar',
                  'Surulere • 1 week ago',
                  'Great work on the drainage system. He explained what caused the blockage and how to prevent it. Negotiable pricing too.',
                  const Color(
                    0xFFEEDDCC,
                  ), // Light orange/brown avatar background
                  const Color(0xFF8A5100),
                ),
                const SizedBox(height: 48),

                // 7. SETTINGS MENU
                const Text(
                  'Settings',
                  style: TextStyle(
                    fontFamily: 'PlusJakartaSans',
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 16),

                _buildSettingsItem(
                  context,
                  icon: Icons.person_outline,
                  title: 'Personal Information',
                  subtitle: 'Name, email, phone',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const WorkforcePersonalInfoScreen(),
                    ),
                  ),
                ),
                _buildSettingsItem(
                  context,
                  icon: Icons.location_on_outlined,
                  title: 'Availability & Location',
                  subtitle: 'Toggle availability, update location',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          const WorkforceAvailabilityLocationScreen(),
                    ),
                  ),
                ),
                _buildSettingsItem(
                  context,
                  icon: Icons.verified_user_outlined,
                  title: 'Identity Verification',
                  subtitle: 'BVN / NIN verification',
                  onTap: () => showWorkforceIdentityStatusModal(context),
                ),
                _buildSettingsItem(
                  context,
                  icon: Icons.account_balance_outlined,
                  title: 'Linked Bank Account',
                  subtitle: 'Manage your bank details',
                  onTap: () => showWorkforceLinkedBankModal(context),
                ),
                _buildSettingsItem(
                  context,
                  icon: Icons.notifications_outlined,
                  title: 'Notifications',
                  subtitle: 'Push notification preferences',
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const WorkforceNotificationsScreen(),
                    ),
                  ),
                ),
                _buildSettingsItem(
                  context,
                  icon: Icons.lock_outline,
                  title: 'Security',
                  subtitle: 'Password, PIN, 2FA',
                  onTap: () => showWorkforceSecurityModal(context),
                ),
                _buildSettingsItem(
                  context,
                  icon: Icons.help_outline,
                  title: 'Support',
                  subtitle: 'Help center, contact us',
                  onTap: () => showWorkforceSupportModal(context),
                ),
                _buildSettingsItem(
                  context,
                  icon: Icons.logout,
                  title: 'Sign Out',
                  subtitle: 'Log out of your account',
                  onTap: () => showWorkforceSignOutModal(context),
                  isDestructive: true,
                ),

                const SizedBox(height: 48), // Bottom nav padding
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
    bool isDestructive = false,
  }) {
    const Color primaryColor = Color(0xFF006B32);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: isDestructive
                      ? const Color(0xFFD32F2F).withValues(alpha: 0.1)
                      : primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: isDestructive ? const Color(0xFFD32F2F) : primaryColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: isDestructive
                            ? const Color(0xFFD32F2F)
                            : onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 11,
                        color: onSurfaceVariant.withValues(alpha: 0.7),
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.chevron_right,
                color: onSurfaceVariant.withValues(alpha: 0.4),
                size: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- PRIVATE HELPERS ---

  Widget _buildPortfolioImage(String imageUrl) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.network(
        imageUrl,
        width: 100,
        height: 100,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildReplicateCard(
    String title,
    String price,
    String imageUrl,
    Color primaryColor,
    Color onSurfaceColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 64,
              height: 64,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color(0xFFF3F4F5),
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.edit, color: Color(0xFF191C1D), size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(
    String initials,
    String name,
    String subtitle,
    String text,
    Color avatarBgColor,
    Color avatarTextColor,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: avatarBgColor,
                child: Text(
                  initials,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: avatarTextColor,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      subtitle,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 10,
                        color: const Color(0xFF3D4A3E).withValues(alpha: 0.8),
                      ),
                    ),
                  ],
                ),
              ),
              // Stars
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
          const SizedBox(height: 16),
          Text(
            text,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 13,
              color: Color(0xFF3D4A3E),
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
