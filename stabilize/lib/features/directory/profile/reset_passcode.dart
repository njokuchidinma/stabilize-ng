import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ResetPasscodeScreen extends StatefulWidget {
  const ResetPasscodeScreen({super.key});

  @override
  State<ResetPasscodeScreen> createState() => _ResetPasscodeScreenState();
}

class _ResetPasscodeScreenState extends State<ResetPasscodeScreen> {
  bool _obscurePassword = true;

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
                  child: const Row(
                    children: [
                      Icon(Icons.arrow_back, color: primaryColor),
                      SizedBox(width: 16),
                      Text(
                        'Reset Passcode',
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

                // Icon header
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.dialpad, color: primaryColor, size: 32),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Reset your 4-digit sign-in passcode',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // CURRENT PASSWORD FIELD (to verify identity)
                const Text(
                  'Current Password',
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: onSurfaceColor,
                  ),
                ),
                const SizedBox(height: 8),
                TextField(
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    hintText: 'Enter your password to verify',
                    hintStyle: TextStyle(
                      color: onSurfaceVariant.withValues(alpha: 0.6),
                      fontFamily: 'Inter',
                    ),
                    filled: true,
                    fillColor: surfaceContainerHigh,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                        color: onSurfaceVariant.withValues(alpha: 0.6),
                        size: 20,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // New Passcode
                _buildPasscodeSection('New Passcode', surfaceContainerHigh, onSurfaceColor, onSurfaceVariant),
                const SizedBox(height: 32),

                // Confirm New Passcode
                _buildPasscodeSection('Confirm New Passcode', surfaceContainerHigh, onSurfaceColor, onSurfaceVariant),
                const SizedBox(height: 40),

                // Reset Passcode button
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
                        const SnackBar(content: Text('Passcode reset successfully')),
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
                      'Reset Passcode',
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

  Widget _buildPasscodeSection(String label, Color bgColor, Color onSurface, Color variant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: onSurface,
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(4, (index) {
            return Container(
              width: 56,
              height: 56,
              margin: EdgeInsets.only(right: index < 3 ? 16 : 0),
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: SizedBox(
                  width: 24,
                  child: TextField(
                    maxLength: 1,
                    obscureText: true,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: onSurface,
                    ),
                    decoration: const InputDecoration(
                      counterText: '',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
