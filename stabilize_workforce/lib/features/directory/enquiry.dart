import 'package:flutter/material.dart';
// Import the messages screen so the chat button knows where to go!
import 'package:stabilize_workforce/features/directory/messages.dart';

class WorkforceEnquiriesScreen extends StatelessWidget {
  const WorkforceEnquiriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot" design system
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      // No Bottom Nav here! Handled by WorkforceMainLayout
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
                          'Artisan Hub',
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

                // 2. HEADER SECTION
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Enquiries',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 32,
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                        letterSpacing: -0.5,
                      ),
                    ),
                    // The Chat Icon that pushes the Messages Screen
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                const WorkforceMessagesScreen(),
                          ),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: primaryColor.withValues(alpha: 0.15),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.chat,
                          color: primaryColor,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Manage incoming requests from potential\ncustomers nearby.',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    color: onSurfaceVariant.withValues(alpha: 0.9),
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 32),

                // 3. ENQUIRY CARDS LIST
                _buildEnquiryCard(
                  name: 'Corper Samuel',
                  distance: '2.5km away',
                  date: 'Oct 12',
                  jobTitle: 'Fixing 3-seater sofa',
                  budget: '₦15,000',
                  avatarUrl: 'https://i.pravatar.cc/150?img=11',
                ),
                const SizedBox(height: 20),

                _buildEnquiryCard(
                  name: 'Amaka Peters',
                  distance: '0.8km away',
                  date: 'Oct 13',
                  jobTitle: 'Kitchen cabinet repair',
                  budget: '₦22,500',
                  avatarUrl: 'https://i.pravatar.cc/150?img=5',
                ),
                const SizedBox(height: 20),

                _buildEnquiryCard(
                  name: 'John Okafor',
                  distance: '5.2km away',
                  date: 'Oct 14',
                  jobTitle: 'Door hinge replacement',
                  budget: '₦8,000',
                  avatarUrl: 'https://i.pravatar.cc/150?img=12',
                ),
                const SizedBox(height: 48), // Padding for the bottom nav
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- PRIVATE HELPER: ENQUIRY CARD ---
  Widget _buildEnquiryCard({
    required String name,
    required String distance,
    required String date,
    required String jobTitle,
    required String budget,
    required String avatarUrl,
  }) {
    const Color primaryColor = Color(0xFF006B32);
    const Color secondaryColor = Color(
      0xFF8A5100,
    ); // Brown/Orange for Negotiate
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x0A000000), // 4% subtle shadow
            blurRadius: 24,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. Top Row: Avatar, Info, and Date Pill
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  avatarUrl,
                  width: 48,
                  height: 48,
                  fit: BoxFit.cover,
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
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          size: 14,
                          color: onSurfaceVariant,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          distance,
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 12,
                            color: onSurfaceVariant.withValues(alpha: 0.8),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: primaryColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  date,
                  style: const TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // 2. Job Details
          const Text(
            'JOB REQUEST',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 10,
              fontWeight: FontWeight.w700,
              letterSpacing: 1.5,
              color: onSurfaceVariant,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            jobTitle,
            style: const TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: onSurfaceColor,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                'Budget: ',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
              Text(
                budget,
                style: const TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // 3. Action Buttons
          _buildActionButton(
            label: 'Accept',
            icon: Icons.check_circle,
            bgColor: primaryColor,
            textColor: Colors.white,
          ),
          const SizedBox(height: 12),

          _buildActionButton(
            label: 'Negotiate',
            icon: Icons.payments,
            bgColor: secondaryColor,
            textColor: Colors.white,
          ),
          const SizedBox(height: 12),

          // Chat (Outlined)
          SizedBox(
            width: double.infinity,
            height: 48,
            child: OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.chat, size: 16, color: onSurfaceColor),
              label: const Text(
                'Chat',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: onSurfaceColor,
                ),
              ),
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: outlineVariant.withValues(alpha: 0.5)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          // Decline Text Button
          Center(
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Decline request',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: onSurfaceColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // --- PRIVATE HELPER: ACTION BUTTON ---
  Widget _buildActionButton({
    required String label,
    required IconData icon,
    required Color bgColor,
    required Color textColor,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: Icon(icon, size: 16, color: textColor),
        label: Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
