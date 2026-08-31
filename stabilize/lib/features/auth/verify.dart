import 'package:flutter/material.dart';
import 'package:stabilize/features/auth/identity_verify.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
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
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BACK BUTTON
              GestureDetector(
                onTap: () {
                  // Action to go back
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.arrow_back,
                      color: primaryColor,
                      size: 20,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Back',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: primaryColor,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),

              // HEADER
              const Text(
                'Verify Details',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 32, // headline-lg
                  fontWeight: FontWeight.w800,
                  color: onSurfaceColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'We\'ve sent a 6-digit code to your\nphone/email.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16, // body-lg
                  color: onSurfaceVariant,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 48),

              // OTP INPUT BOXES
              // We use MainAxisAlignment.spaceBetween to distribute the 6 boxes evenly
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _OtpBox(digit: '4', surfaceContainerHigh: surfaceContainerHigh, onSurfaceColor: onSurfaceColor),
                  _OtpBox(digit: '1', surfaceContainerHigh: surfaceContainerHigh, onSurfaceColor: onSurfaceColor),
                  _OtpBox(digit: '9', surfaceContainerHigh: surfaceContainerHigh, onSurfaceColor: onSurfaceColor),
                  _OtpBox(digit: '-', surfaceContainerHigh: surfaceContainerHigh, onSurfaceColor: onSurfaceColor),
                  _OtpBox(digit: '-', surfaceContainerHigh: surfaceContainerHigh, onSurfaceColor: onSurfaceColor),
                  _OtpBox(digit: '-', surfaceContainerHigh: surfaceContainerHigh, onSurfaceColor: onSurfaceColor),
                ],
              ),

              const SizedBox(height: 40),

              // RESEND CODE SECTION
              Center(
                child: Column(
                  children: [
                    Text(
                      'Didn\'t receive code?',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: onSurfaceVariant.withValues(alpha: 0.8),
                      ),
                    ),
                    const SizedBox(height: 8),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Code resent successfully')),
                        );
                      },
                      child: const Text(
                        'Resend Code (45s)',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // VERIFY & CONTINUE BUTTON
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
                  boxShadow: [
                    BoxShadow(
                      color: onSurfaceColor.withValues(alpha: 0.06),
                      blurRadius: 24,
                      offset: const Offset(0, 0),
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const IdentityVerificationScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Verify & Continue',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// -----------------------------------------------------------------------------
// PRIVATE HELPER WIDGET: Draws a single OTP square.
// -----------------------------------------------------------------------------
class _OtpBox extends StatelessWidget {
  final String digit;
  final Color surfaceContainerHigh;
  final Color onSurfaceColor;

  const _OtpBox({
    required this.digit,
    required this.surfaceContainerHigh,
    required this.onSurfaceColor,
  });

  @override
  Widget build(BuildContext context) {
    // We use a Container to strictly enforce the "No-Line" rule.
    // Depth is created solely by the background color shift.
    return Container(
      width: 48,
      height: 56,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: surfaceContainerHigh,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        digit,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: onSurfaceColor,
        ),
      ),
    );
  }
}