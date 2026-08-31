import 'package:flutter/material.dart';

class SupportModal extends StatelessWidget {
  const SupportModal({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceContainerLow = Color(0xFFF3F4F5);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 32),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Drag Handle
          Container(
            width: 40,
            height: 4,
            margin: const EdgeInsets.only(bottom: 24),
            decoration: BoxDecoration(
              color: const Color(0xFFE7E8E9),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Support Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.support_agent,
              color: primaryColor,
              size: 28,
            ),
          ),
          const SizedBox(height: 20),

          // Headline
          const Text(
            'How can we help?',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: onSurfaceColor,
            ),
          ),
          const SizedBox(height: 24),

          // Support Options
          _buildSupportOption(
            context,
            Icons.chat_bubble_outline,
            'Chat with Us',
            'Available 9am – 6pm WAT',
            primaryColor,
            surfaceContainerLow,
            onSurfaceColor,
            onSurfaceVariant,
            () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening live chat...')),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildSupportOption(
            context,
            Icons.email_outlined,
            'Email Support',
            'support@stabilize.ng',
            primaryColor,
            surfaceContainerLow,
            onSurfaceColor,
            onSurfaceVariant,
            () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Opening email client...')),
              );
            },
          ),
          const SizedBox(height: 12),
          _buildSupportOption(
            context,
            Icons.help_outline,
            'FAQs',
            'Find answers quickly',
            primaryColor,
            surfaceContainerLow,
            onSurfaceColor,
            onSurfaceVariant,
            () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Loading FAQs...')),
              );
            },
          ),
          const SizedBox(height: 24),

          // Footer
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time,
                size: 14,
                color: onSurfaceVariant.withValues(alpha: 0.5),
              ),
              const SizedBox(width: 6),
              Text(
                'Response time: Usually within 2 hours',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: onSurfaceVariant.withValues(alpha: 0.5),
                ),
              ),
            ],
          ),

          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildSupportOption(
    BuildContext context,
    IconData icon,
    String title,
    String subtitle,
    Color primaryColor,
    Color bgColor,
    Color titleColor,
    Color subtitleColor,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: titleColor,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    color: subtitleColor.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: const Color(0xFFC4C7C5), size: 20),
        ],
      ),
      ),
    );
  }
}
