import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stabilize/features/auth/verify.dart';

class CreatePasscodeScreen extends StatelessWidget {
  const CreatePasscodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              // BACK BUTTON
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: primaryColor, size: 20),
                    SizedBox(width: 4),
                    Text(
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
              const SizedBox(height: 24),

              // STEP INDICATOR
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'STEP 2 OF 4',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                      color: primaryColor,
                    ),
                  ),
                  Text(
                    'Security Setup',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 11,
                      color: onSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // PROGRESS BAR
              Container(
                height: 8,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: surfaceContainerHigh,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: FractionallySizedBox(
                  alignment: Alignment.centerLeft,
                  widthFactor: 0.50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 32),

              // MAIN CONTENT CARD
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: surfaceContainerLowest,
                  borderRadius: BorderRadius.circular(24),
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
                    // ICON
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
                    const SizedBox(height: 24),

                    // HEADLINE
                    const Center(
                      child: Text(
                        'Create Your Passcode',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 24,
                          fontWeight: FontWeight.w800,
                          color: onSurfaceColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        'Set a 4-digit passcode for quick sign-in.\nYou can also use your password to sign in.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: onSurfaceVariant.withValues(alpha: 0.8),
                          height: 1.6,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // CREATE PASSCODE
                    _buildPasscodeSection('Create Passcode', surfaceContainerHigh, onSurfaceColor, onSurfaceVariant),
                    const SizedBox(height: 32),

                    // CONFIRM PASSCODE
                    _buildPasscodeSection('Confirm Passcode', surfaceContainerHigh, onSurfaceColor, onSurfaceVariant),
                    const SizedBox(height: 32),

                    // SECURITY NOTICE
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: primaryColor.withValues(alpha: 0.08),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: primaryColor.withValues(alpha: 0.15),
                          width: 1,
                        ),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline, color: primaryColor, size: 18),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Your passcode provides quick access to your account. Keep it private and never share it with anyone.',
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

              const SizedBox(height: 32),

              // CONTINUE BUTTON
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
                      MaterialPageRoute(builder: (_) => const VerifyScreen()),
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
                    'Continue',
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
