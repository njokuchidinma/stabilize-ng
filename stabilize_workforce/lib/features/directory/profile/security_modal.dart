import 'package:flutter/material.dart';
import 'package:stabilize_workforce/features/directory/profile/change_password.dart';
import 'package:stabilize_workforce/features/directory/profile/change_pin.dart';
import 'package:stabilize_workforce/features/directory/profile/change_passcode.dart';

void showWorkforceSecurityModal(BuildContext context) {
  const Color onSurfaceColor = Color(0xFF191C1D);

  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: const Color(0xFFE7E8E9),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Security',
              style: TextStyle(
                fontFamily: 'PlusJakartaSans',
                fontSize: 20,
                fontWeight: FontWeight.w800,
                color: onSurfaceColor,
              ),
            ),
            const SizedBox(height: 20),

            _buildSecurityOption(
              context,
              icon: Icons.lock_outline,
              title: 'Change Password',
              subtitle: 'Update your login password',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkforceChangePasswordScreen()));
              },
            ),
            _buildSecurityOption(
              context,
              icon: Icons.pin_outlined,
              title: 'Change PIN',
              subtitle: 'Update your transaction PIN',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkforceChangePinScreen()));
              },
            ),
            _buildSecurityOption(
              context,
              icon: Icons.dialpad,
              title: 'Change Passcode',
              subtitle: 'Update your 4-digit passcode',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (_) => const WorkforceChangePasscodeScreen()));
              },
            ),
            _buildSecurityOption(
              context,
              icon: Icons.security,
              title: 'Two-Factor Authentication',
              subtitle: 'Add an extra layer of security',
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('2FA settings coming soon')),
                );
              },
            ),
            const SizedBox(height: 8),
          ],
        ),
      );
    },
  );
}

Widget _buildSecurityOption(
  BuildContext context, {
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  const Color primaryColor = Color(0xFF006B32);
  const Color onSurfaceColor = Color(0xFF191C1D);
  const Color onSurfaceVariant = Color(0xFF3D4A3E);

  return GestureDetector(
    onTap: onTap,
    behavior: HitTestBehavior.opaque,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: primaryColor, size: 20),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
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
          Icon(Icons.chevron_right, color: onSurfaceVariant.withValues(alpha: 0.4), size: 20),
        ],
      ),
    ),
  );
}
