import 'package:flutter/material.dart';
import 'package:stabilize/features/directory/profile/change_password.dart';
import 'package:stabilize/features/directory/profile/change_pin.dart';
import 'package:stabilize/features/directory/profile/reset_passcode.dart';
import 'package:stabilize/features/directory/profile/two_factor_auth.dart';

class SecurityModal extends StatelessWidget {
  const SecurityModal({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color surfaceContainerLow = Color(0xFFF3F4F5);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);

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

          // Lock Icon
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.lock_outline,
              color: primaryColor,
              size: 28,
            ),
          ),
          const SizedBox(height: 20),

          // Headline
          const Text(
            'Security',
            style: TextStyle(
              fontFamily: 'PlusJakartaSans',
              fontSize: 20,
              fontWeight: FontWeight.w800,
              color: onSurfaceColor,
            ),
          ),
          const SizedBox(height: 24),

          // Security Options Card
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: surfaceContainerLow,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              children: [
                _buildSecurityRow(
                  Icons.key,
                  'Change Password',
                  'Update your account password',
                  primaryColor,
                  onSurfaceColor,
                  onSurfaceVariant,
                  outlineVariant,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ChangePasswordScreen()),
                    );
                  },
                ),
                Divider(color: outlineVariant.withValues(alpha: 0.3), height: 1, indent: 56),
                _buildSecurityRow(
                  Icons.pin,
                  'Change PIN',
                  'Update your 4-digit transaction PIN',
                  primaryColor,
                  onSurfaceColor,
                  onSurfaceVariant,
                  outlineVariant,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ChangePinScreen()),
                    );
                  },
                ),
                Divider(color: outlineVariant.withValues(alpha: 0.3), height: 1, indent: 56),
                _buildSecurityRow(
                  Icons.dialpad,
                  'Reset Passcode',
                  'Update your 4-digit sign-in passcode',
                  primaryColor,
                  onSurfaceColor,
                  onSurfaceVariant,
                  outlineVariant,
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const ResetPasscodeScreen()),
                    );
                  },
                ),
                Divider(color: outlineVariant.withValues(alpha: 0.3), height: 1, indent: 56),
                _buildSecurityRow(
                  Icons.security,
                  'Two-Factor Authentication',
                  null,
                  primaryColor,
                  onSurfaceColor,
                  onSurfaceVariant,
                  outlineVariant,
                  statusPill: 'ENABLED',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const TwoFactorAuthScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          SizedBox(height: MediaQuery.of(context).padding.bottom),
        ],
      ),
    );
  }

  Widget _buildSecurityRow(
    IconData icon,
    String title,
    String? subtitle,
    Color primaryColor,
    Color onSurfaceColor,
    Color onSurfaceVariant,
    Color outlineVariant, {
    String? statusPill,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
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
                    color: onSurfaceColor,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 3),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      color: onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ],
              ],
            ),
          ),
          if (statusPill != null)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              margin: const EdgeInsets.only(right: 4),
              decoration: BoxDecoration(
                color: primaryColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                statusPill,
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),
            ),
          Icon(Icons.chevron_right, color: outlineVariant, size: 20),
        ],
      ),
    ),
    );
  }
}
