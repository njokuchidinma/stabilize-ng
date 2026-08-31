import 'package:flutter/material.dart';

class NotificationsSettingsScreen extends StatefulWidget {
  const NotificationsSettingsScreen({super.key});

  @override
  State<NotificationsSettingsScreen> createState() => _NotificationsSettingsScreenState();
}

class _NotificationsSettingsScreenState extends State<NotificationsSettingsScreen> {
  // Toggle states
  bool _pushNotifications = true;
  bool _emailNotifications = true;
  bool _smsNotifications = false;
  bool _bookingConfirmations = true;
  bool _messages = true;
  bool _promotions = false;
  bool _upcomingBookings = true;
  bool _reviewReminders = true;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

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
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(Icons.arrow_back, color: primaryColor),
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Notifications',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // GENERAL
                _buildSectionHeader('GENERAL'),
                _buildCardGroup([
                  _buildToggleRow(
                    Icons.notifications_active,
                    'Push Notifications',
                    'Receive alerts on your device',
                    _pushNotifications,
                    (v) => setState(() => _pushNotifications = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  _buildDivider(),
                  _buildToggleRow(
                    Icons.email_outlined,
                    'Email Notifications',
                    'Get updates via email',
                    _emailNotifications,
                    (v) => setState(() => _emailNotifications = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  _buildDivider(),
                  _buildToggleRow(
                    Icons.sms_outlined,
                    'SMS Notifications',
                    'Receive text messages',
                    _smsNotifications,
                    (v) => setState(() => _smsNotifications = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                ]),
                const SizedBox(height: 32),

                // ACTIVITY
                _buildSectionHeader('ACTIVITY'),
                _buildCardGroup([
                  _buildToggleRow(
                    Icons.check_circle_outline,
                    'Booking Confirmations',
                    'When a booking is confirmed or updated',
                    _bookingConfirmations,
                    (v) => setState(() => _bookingConfirmations = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  _buildDivider(),
                  _buildToggleRow(
                    Icons.chat_bubble_outline,
                    'Messages',
                    'When you receive a new message',
                    _messages,
                    (v) => setState(() => _messages = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  _buildDivider(),
                  _buildToggleRow(
                    Icons.local_offer_outlined,
                    'Promotions & Offers',
                    'Deals and discounts from artisans',
                    _promotions,
                    (v) => setState(() => _promotions = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                ]),
                const SizedBox(height: 32),

                // REMINDERS
                _buildSectionHeader('REMINDERS'),
                _buildCardGroup([
                  _buildToggleRow(
                    Icons.event_outlined,
                    'Upcoming Bookings',
                    'Remind me before scheduled bookings',
                    _upcomingBookings,
                    (v) => setState(() => _upcomingBookings = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                  _buildDivider(),
                  _buildToggleRow(
                    Icons.rate_review_outlined,
                    'Review Reminders',
                    'Remind me to review completed services',
                    _reviewReminders,
                    (v) => setState(() => _reviewReminders = v),
                    primaryColor,
                    onSurfaceColor,
                    onSurfaceVariant,
                  ),
                ]),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
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
      child: Column(children: children),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: const Color(0xFFC4C7C5).withValues(alpha: 0.3),
      height: 1,
      indent: 56,
    );
  }

  Widget _buildToggleRow(
    IconData icon,
    String title,
    String subtitle,
    bool value,
    ValueChanged<bool> onChanged,
    Color primaryColor,
    Color onSurfaceColor,
    Color onSurfaceVariant,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F5),
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
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    color: onSurfaceVariant.withValues(alpha: 0.6),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Colors.white,
            activeTrackColor: primaryColor,
            inactiveThumbColor: Colors.white,
            inactiveTrackColor: const Color(0xFFE7E8E9),
          ),
        ],
      ),
    );
  }
}
