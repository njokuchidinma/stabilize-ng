import 'package:flutter/material.dart';

class TwoFactorAuthScreen extends StatefulWidget {
  const TwoFactorAuthScreen({super.key});

  @override
  State<TwoFactorAuthScreen> createState() => _TwoFactorAuthScreenState();
}

class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
  bool _smsEnabled = true;
  bool _emailEnabled = false;
  bool _authenticatorEnabled = false;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerLow = Color(0xFFF3F4F5);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
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
                // App Bar
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, color: primaryColor),
                      const SizedBox(width: 16),
                      const Text(
                        'Two-Factor Authentication',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: onSurfaceColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Status card
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: primaryColor.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: primaryColor.withValues(alpha: 0.2)),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: primaryColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Icon(Icons.security, color: primaryColor, size: 24),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '2FA is Enabled',
                              style: TextStyle(
                                fontFamily: 'PlusJakartaSans',
                                fontSize: 16,
                                fontWeight: FontWeight.w800,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              'Your account has an extra layer of security',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: onSurfaceVariant.withValues(alpha: 0.7),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Authentication methods section
                Text(
                  'AUTHENTICATION METHODS',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 16),

                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: surfaceContainerLow,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      _buildMethodRow(
                        Icons.sms,
                        'SMS Verification',
                        'Receive codes via text message',
                        _smsEnabled,
                        (v) => setState(() => _smsEnabled = v),
                        primaryColor,
                        onSurfaceColor,
                        onSurfaceVariant,
                      ),
                      Divider(color: surfaceContainerHigh, height: 1, indent: 56),
                      _buildMethodRow(
                        Icons.email_outlined,
                        'Email Verification',
                        'Receive codes via email',
                        _emailEnabled,
                        (v) => setState(() => _emailEnabled = v),
                        primaryColor,
                        onSurfaceColor,
                        onSurfaceVariant,
                      ),
                      Divider(color: surfaceContainerHigh, height: 1, indent: 56),
                      _buildMethodRow(
                        Icons.phone_android,
                        'Authenticator App',
                        'Use Google Authenticator or similar',
                        _authenticatorEnabled,
                        (v) => setState(() => _authenticatorEnabled = v),
                        primaryColor,
                        onSurfaceColor,
                        onSurfaceVariant,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Recovery section
                Text(
                  'RECOVERY',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.5,
                    color: onSurfaceVariant.withValues(alpha: 0.5),
                  ),
                ),
                const SizedBox(height: 16),

                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: onSurfaceColor.withValues(alpha: 0.04),
                        blurRadius: 24,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: surfaceContainerLow,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Icon(Icons.vpn_key, color: onSurfaceVariant.withValues(alpha: 0.7), size: 20),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Recovery Codes',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: onSurfaceColor,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              '8 codes remaining',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                color: onSurfaceVariant.withValues(alpha: 0.6),
                              ),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text(
                                'Recovery Codes',
                                style: TextStyle(
                                  fontFamily: 'PlusJakartaSans',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              content: const Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Store these codes in a safe place:', style: TextStyle(fontFamily: 'Inter', fontSize: 13)),
                                  SizedBox(height: 12),
                                  Text('A3X9-K2M4', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                                  Text('B7P1-R5N8', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                                  Text('C4W6-T3J2', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                                  Text('D8L5-Q9F1', style: TextStyle(fontFamily: 'Inter', fontWeight: FontWeight.w600)),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: const Text('Close'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text(
                          'View',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 13,
                            fontWeight: FontWeight.w700,
                            color: primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMethodRow(
    IconData icon,
    String title,
    String subtitle,
    bool enabled,
    ValueChanged<bool> onChanged,
    Color primaryColor,
    Color onSurface,
    Color variant,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
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
                    color: onSurface,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 11,
                    color: variant.withValues(alpha: 0.7),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: enabled,
            onChanged: onChanged,
            activeThumbColor: primaryColor,
          ),
        ],
      ),
    );
  }
}
