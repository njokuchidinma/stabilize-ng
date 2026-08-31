import 'package:flutter/material.dart';

class WorkforceNotificationsScreen extends StatefulWidget {
  const WorkforceNotificationsScreen({super.key});

  @override
  State<WorkforceNotificationsScreen> createState() => _WorkforceNotificationsScreenState();
}

class _WorkforceNotificationsScreenState extends State<WorkforceNotificationsScreen> {
  bool _bookingAlerts = true;
  bool _enquiryAlerts = true;
  bool _messageAlerts = true;
  bool _payoutAlerts = true;
  bool _promotionalAlerts = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        backgroundColor: surfaceColor,
        elevation: 0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back, color: onSurfaceColor),
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontFamily: 'PlusJakartaSans',
            fontSize: 18,
            fontWeight: FontWeight.w800,
            color: primaryColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Push Notifications',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: onSurfaceColor,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Choose which notifications you want to receive.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 13,
                  color: onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 24),
              _buildToggle('Booking Alerts', 'New bookings and status updates', _bookingAlerts, (v) => setState(() => _bookingAlerts = v), primaryColor, onSurfaceColor, onSurfaceVariant),
              _buildToggle('Enquiry Alerts', 'New service enquiries from clients', _enquiryAlerts, (v) => setState(() => _enquiryAlerts = v), primaryColor, onSurfaceColor, onSurfaceVariant),
              _buildToggle('Message Alerts', 'New messages from clients', _messageAlerts, (v) => setState(() => _messageAlerts = v), primaryColor, onSurfaceColor, onSurfaceVariant),
              _buildToggle('Payout Alerts', 'Payment and payout notifications', _payoutAlerts, (v) => setState(() => _payoutAlerts = v), primaryColor, onSurfaceColor, onSurfaceVariant),
              _buildToggle('Promotional', 'Tips, offers, and platform updates', _promotionalAlerts, (v) => setState(() => _promotionalAlerts = v), primaryColor, onSurfaceColor, onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildToggle(String title, String subtitle, bool value, ValueChanged<bool> onChanged, Color primaryColor, Color onSurfaceColor, Color onSurfaceVariant) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
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
                      color: onSurfaceColor,
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
            Switch(
              value: value,
              onChanged: onChanged,
              activeThumbColor: primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
