import 'package:flutter/material.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color primaryContainer = Color(0xFF008740);
    const Color surfaceColor = Color(0xFFF8F9FA);
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
                        'Change Password',
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

                // Lock icon header
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.lock_outline, color: primaryColor, size: 32),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Create a strong, unique password',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Current Password
                _buildLabel('Current Password', onSurfaceColor),
                const SizedBox(height: 8),
                _buildPasswordField(
                  'Enter current password',
                  _obscureCurrent,
                  () => setState(() => _obscureCurrent = !_obscureCurrent),
                  surfaceContainerHigh,
                  onSurfaceVariant,
                ),
                const SizedBox(height: 24),

                // New Password
                _buildLabel('New Password', onSurfaceColor),
                const SizedBox(height: 8),
                _buildPasswordField(
                  'Enter new password',
                  _obscureNew,
                  () => setState(() => _obscureNew = !_obscureNew),
                  surfaceContainerHigh,
                  onSurfaceVariant,
                ),
                const SizedBox(height: 24),

                // Confirm Password
                _buildLabel('Confirm New Password', onSurfaceColor),
                const SizedBox(height: 8),
                _buildPasswordField(
                  'Re-enter new password',
                  _obscureConfirm,
                  () => setState(() => _obscureConfirm = !_obscureConfirm),
                  surfaceContainerHigh,
                  onSurfaceVariant,
                ),
                const SizedBox(height: 24),

                // Password requirements
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF3F4F5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'PASSWORD REQUIREMENTS',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 9,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 1.2,
                          color: onSurfaceVariant.withValues(alpha: 0.5),
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildRequirement('At least 8 characters', true, primaryColor, onSurfaceVariant),
                      const SizedBox(height: 8),
                      _buildRequirement('One uppercase letter', true, primaryColor, onSurfaceVariant),
                      const SizedBox(height: 8),
                      _buildRequirement('One number', false, primaryColor, onSurfaceVariant),
                      const SizedBox(height: 8),
                      _buildRequirement('One special character', false, primaryColor, onSurfaceVariant),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Update Password button
                Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    gradient: const LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [primaryColor, primaryContainer],
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Password updated successfully')),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Update Password',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
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

  Widget _buildLabel(String text, Color color) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Inter',
        fontSize: 12,
        fontWeight: FontWeight.w600,
        color: color,
      ),
    );
  }

  Widget _buildPasswordField(
    String hint,
    bool obscure,
    VoidCallback onToggle,
    Color fillColor,
    Color hintColor,
  ) {
    return TextField(
      obscureText: obscure,
      style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(
          fontFamily: 'Inter',
          fontSize: 14,
          color: hintColor.withValues(alpha: 0.5),
        ),
        filled: true,
        fillColor: fillColor,
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        suffixIcon: GestureDetector(
          onTap: onToggle,
          child: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: hintColor.withValues(alpha: 0.5),
            size: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildRequirement(String text, bool met, Color primaryColor, Color variant) {
    return Row(
      children: [
        Icon(
          met ? Icons.check_circle : Icons.circle_outlined,
          size: 16,
          color: met ? primaryColor : variant.withValues(alpha: 0.3),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            color: met ? primaryColor : variant.withValues(alpha: 0.6),
            fontWeight: met ? FontWeight.w600 : FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
