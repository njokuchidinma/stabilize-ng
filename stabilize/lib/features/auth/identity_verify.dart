import 'package:flutter/material.dart';
// Make sure this matches your project name!
import 'package:stabilize/core/widgets/custom_text_field.dart';
import 'package:stabilize/features/directory/main_layout.dart';


class IdentityVerificationScreen extends StatelessWidget {
  const IdentityVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color primaryContainer = Color(0xFF008740);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerLowest = Color(0xFFFFFFFF);
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
              // HEADER ROW (Step and Security Level)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'STEP 4 OF 4',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: primaryColor, // Green text for brand moment
                    ),
                  ),
                  Text(
                    'Security Level: High',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      color: onSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // THE "NAIJA PROGRESS" BAR
              Container(
                height: 8, // Thick track
                width: double.infinity,
                decoration: BoxDecoration(
                  color: surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(8), // Full rounded
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 1.0, // 4 out of 4 steps = 100%
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // MAIN CONTENT CARD (Surface Container Lowest)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest, // White card
                  borderRadius: BorderRadius.circular(24), // xl radius
                  // Subtle ambient shadow to lift it off the gray background
                  boxShadow: [
                    BoxShadow(
                      color: onSurfaceColor.withValues(alpha: 0.04),
                      blurRadius: 24,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // CARD HEADLINE
                    const Text(
                      'Secure Your Profile',
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 24, // headline-md
                        fontWeight: FontWeight.w800,
                        color: onSurfaceColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Please provide your BVN or NIN. This ensures a safe community for all users in your new city.',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 14,
                        color: onSurfaceVariant,
                        height: 1.6,
                      ),
                    ),
                    const SizedBox(height: 32),

                    // DROPDOWN: Identity Document Type
                    const Text(
                      'Identity Document Type',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: onSurfaceVariant,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 56,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: surfaceColor, // Using standard surface color inside the white card
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Bank Verification Number ()',
                            style: TextStyle(
                              color: onSurfaceColor,
                              fontFamily: 'Inter',
                              fontSize: 14,
                            ),
                          ),
                          Icon(Icons.keyboard_arrow_down, color: onSurfaceVariant),
                        ],
                      ),
                    ),

                    const SizedBox(height: 24),

                    // NUMBER INPUT (Reusing our Generic Widget!)
                    const CustomTextField(
                      label: 'Number',
                      hint: '2241 1234 567',
                      keyboardType: TextInputType.number,
                    ),

                    const SizedBox(height: 32),

                    // SECURITY NOTICE BOX
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryColor.withValues(alpha: 0.08), // Very subtle green background
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: primaryColor.withValues(alpha: 0.15), // Ghost border
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.verified_user, // Shield with checkmark
                            color: primaryColor,
                            size: 18,
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Your data is encrypted and secure. We only use this for identity verification through official Nigerian channels.',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 11,
                                color: onSurfaceVariant.withValues(alpha: 0.9),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // PRIMARY BUTTON: Verify Identity
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
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const MainLayout()),
                      (Route<dynamic> route) => false,
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
                    'Verify Identity',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // TERTIARY BUTTON: I'll do this later
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => const MainLayout()),
                      (Route<dynamic> route) => false, // "false" means delete every screen in the history
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: onSurfaceVariant, // Ripple color
                  ),
                  child: Text(
                    "I'll do this later",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: onSurfaceVariant,
                    ),
                  ),
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