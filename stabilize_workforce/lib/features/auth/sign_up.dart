import 'package:flutter/material.dart';
import 'package:stabilize_workforce/features/onboarding/onboarding.dart';
import 'package:stabilize_workforce/features/auth/verification.dart';
import 'package:stabilize_workforce/features/auth/sign_in.dart';

class WorkforceSignupScreen extends StatefulWidget {
  const WorkforceSignupScreen({super.key});

  @override
  State<WorkforceSignupScreen> createState() => _WorkforceSignupScreenState();
}

class _WorkforceSignupScreenState extends State<WorkforceSignupScreen> {
  String _selectedService = 'Plumbing';

  final List<String> _services = [
    'Plumbing', 'Electrical', 'Carpentry', 'AC Repair', 'Painting', '+ Other'
  ];

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color highlightGreen = Color(0xFF4ADE80);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. The Hero from the Onboarding feature
            const WorkforceHero(),

            // 2. The Form built directly into the Auth screen
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'STEP 01 OF 03',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      letterSpacing: 1.5,
                      color: primaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Tell us about your\nbusiness',
                    style: TextStyle(
                      fontFamily: 'PlusJakartaSans',
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: onSurfaceColor,
                      height: 1.2,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "Let's create your professional profile for\npotential clients.",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: onSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                  const SizedBox(height: 32),

                  _buildLabel('Full Name', onSurfaceColor),
                  _buildTextField('e.g. Chinelo Okoro', surfaceContainerHigh, onSurfaceVariant),
                  const SizedBox(height: 20),

                  _buildLabel('Business Name', onSurfaceColor),
                  _buildTextField('e.g. Apex Electricals', surfaceContainerHigh, onSurfaceVariant),
                  const SizedBox(height: 20),

                  _buildLabel('Services Offered', onSurfaceColor),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: _services.map((service) {
                      final isSelected = _selectedService == service;
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            _selectedService = service;
                          });
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: isSelected ? highlightGreen.withValues(alpha: 0.9) : surfaceContainerHigh,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            service,
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                              color: isSelected ? primaryColor : onSurfaceVariant,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 24),

                  _buildLabel('Primary Location (Abuja)', onSurfaceColor),
                  Container(
                    height: 56,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: surfaceContainerHigh,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Maitama',
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            color: onSurfaceVariant.withValues(alpha: 0.7),
                          ),
                        ),
                        Icon(Icons.keyboard_arrow_down, color: onSurfaceVariant.withValues(alpha: 0.7)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),

                  _buildLabel('Phone Number', onSurfaceColor),
                  Row(
                    children: [
                      Container(
                        height: 56,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        decoration: BoxDecoration(
                          color: surfaceContainerHigh,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text(
                            '+234',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: onSurfaceColor,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildTextField('803 000 0000', surfaceContainerHigh, onSurfaceVariant),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const WorkforceVerificationScreen()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
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
                  const SizedBox(height: 16),
                  Center(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const WorkforceSignInScreen()),
                        );
                      },
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(fontFamily: 'Inter', fontSize: 14),
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyle(color: onSurfaceVariant.withValues(alpha: 0.8)),
                            ),
                            const TextSpan(
                              text: 'Sign In',
                              style: TextStyle(
                                color: primaryColor,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // --- PRIVATE HELPERS FOR THE FORM ---

  Widget _buildLabel(String text, Color textColor) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, Color fillColor, Color hintColor) {
    return SizedBox(
      height: 56,
      child: TextField(
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: hintColor.withValues(alpha: 0.5),
            fontFamily: 'Inter',
            fontSize: 14,
          ),
          filled: true,
          fillColor: fillColor,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}