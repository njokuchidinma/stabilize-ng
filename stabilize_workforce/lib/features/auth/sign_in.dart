import 'package:flutter/material.dart';
import 'package:stabilize_workforce/features/auth/sign_up.dart';
import 'package:stabilize_workforce/features/auth/passcode_sign_in.dart';
import 'package:stabilize_workforce/features/auth/verification.dart';

class WorkforceSignInScreen extends StatelessWidget {
  const WorkforceSignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color primaryContainer = Color(0xFF008740);
    const Color secondaryColor = Color(0xFF8A5100);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 36,
                    height: 36,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(width: 10),
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: 'Stabilize ',
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(
                          text: 'Workforce',
                          style: TextStyle(color: onSurfaceColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              // HEADER
              const Text(
                'Sign In',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 40,
                  fontWeight: FontWeight.w800,
                  color: onSurfaceColor,
                  letterSpacing: -1.0,
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Welcome back! Access your dashboard\nand manage your bookings.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16,
                  color: onSurfaceVariant,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 48),

              // PHONE NUMBER LABEL
              const Text(
                'Phone Number',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12,
                  color: onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  // Country Code Box
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        // Nigeria Flag
                        Container(
                          width: 20,
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(
                              color: Colors.black12,
                              width: 0.5,
                            ),
                          ),
                          child: Row(
                            children: [
                              Expanded(child: Container(color: primaryColor)),
                              Expanded(child: Container(color: Colors.white)),
                              Expanded(child: Container(color: primaryColor)),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          '+234',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: onSurfaceColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Phone Number Input
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: '801 234 5678',
                        hintStyle: TextStyle(
                          color: onSurfaceVariant.withValues(alpha: 0.6),
                          fontFamily: 'Inter',
                        ),
                        filled: true,
                        fillColor: surfaceContainerHigh,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 18,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),

              // SEND OTP BUTTON
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
                      MaterialPageRoute(
                        builder: (_) => const WorkforceVerificationScreen(),
                      ),
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
                    'Send OTP',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // LOGIN WITH PASSCODE
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const WorkforcePasscodeSignInScreen(),
                      ),
                    );
                  },
                  style: TextButton.styleFrom(foregroundColor: primaryColor),
                  child: const Text(
                    'LOGIN WITH PASSCODE',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: primaryColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 64),

              // FOOTER
              Center(
                child: Column(
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: onSurfaceVariant.withValues(alpha: 0.9),
                      ),
                    ),
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const WorkforceSignupScreen(),
                          ),
                        );
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: secondaryColor.withValues(alpha: 0.1),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
