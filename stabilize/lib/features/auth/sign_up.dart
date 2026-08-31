import 'package:flutter/material.dart';
// Make sure this path matches your actual project name!
import 'package:stabilize/core/widgets/custom_text_field.dart';
import 'package:stabilize/features/auth/create_passcode.dart';
import 'package:stabilize/features/auth/sign_in.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color primaryContainer = Color(0xFF008740);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color surfaceContainerHigh = Color(0xFFE7E8E9);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);
    const Color outlineVariant = Color(0xFFC4C7C5);

    return Scaffold(
      backgroundColor: surfaceColor,
      // SingleChildScrollView prevents the "Yellow/Black Striped" error
      // when the keyboard pops up and covers the screen.
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // HEADER
              const Text(
                'Welcome Home',
                style: TextStyle(
                  fontFamily: 'PlusJakartaSans',
                  fontSize: 32, // headline-lg
                  fontWeight: FontWeight.w800,
                  color: onSurfaceColor,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Enter your details to start your journey.',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 16, // body-lg
                  color: onSurfaceVariant,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 40),

              // FORM FIELDS
              // Row for First Name and Last Name
              const Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      label: 'First Name',
                      hint: 'John',
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: CustomTextField(
                      label: 'Last Name',
                      hint: 'Doe',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Email Address
              const CustomTextField(
                label: 'Email Address',
                hint: 'john.doe@example.com',
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 24),

              // Phone Number (Custom layout with Country Code)
              const Text(
                'Phone Number',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12, // label-md
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
                        // Simple custom Nigeria Flag icon
                        Container(
                          width: 20,
                          height: 14,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2),
                            border: Border.all(color: Colors.black12, width: 0.5),
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
                        hintText: '803 123 4567',
                        hintStyle: TextStyle(
                          color: onSurfaceVariant.withValues(alpha: 0.6),
                          fontFamily: 'Inter',
                        ),
                        filled: true,
                        fillColor: surfaceContainerHigh,
                        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none, // No-Line Rule
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Dropdown Field (City/State)
              const Text(
                'City/State Moved To',
                style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 12, // label-md
                  color: onSurfaceVariant,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
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
                      'Select your destination',
                      style: TextStyle(
                        color: onSurfaceVariant.withValues(alpha: 0.6),
                        fontFamily: 'Inter',
                      ),
                    ),
                    const Icon(Icons.keyboard_arrow_down, color: onSurfaceVariant),
                  ],
                ),
              ),

              const SizedBox(height: 48),

              // SEND OTP BUTTON (Primary)
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
                      MaterialPageRoute(builder: (context) => const CreatePasscodeScreen()),
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

              const SizedBox(height: 16),

              // MICRO-COPY
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'You\'ll set up a passcode and verify your\nphone number in the next steps.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 10,
                      color: onSurfaceVariant.withValues(alpha: 0.8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 40),

              // ALREADY HAVE AN ACCOUNT DIVIDER
              Row(
                children: [
                  Expanded(child: Divider(color: outlineVariant.withValues(alpha: 0.15), thickness: 1)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(
                      'Already have an account?',
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 12,
                        color: onSurfaceVariant,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: outlineVariant.withValues(alpha: 0.15), thickness: 1)),
                ],
              ),

              const SizedBox(height: 24),

              // SIGN IN BUTTON (Ghost Border Fallback)
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const SignInScreen()),
                        );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: outlineVariant.withValues(alpha: 0.4), // Ghost border rule
                      width: 1,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Sign In',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: primaryColor,
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