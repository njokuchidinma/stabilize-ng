import 'package:flutter/material.dart';
import 'package:stabilize/features/auth/sign_up.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Colors from "The Digital Patriot"
    const Color primaryColor = Color(0xFF006B32);
    const Color primaryContainer = Color(0xFF008740);
    const Color surfaceColor = Color(0xFFF8F9FA);
    const Color onSurfaceColor = Color(0xFF191C1D);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Scaffold(
      backgroundColor: surfaceColor,
      body: Stack(
        children: [
          // BACKGROUND IMAGE WITH FADE
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: MediaQuery.of(context).size.height * 0.65,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/hero.png',
                  ), // Add your image here
                  fit: BoxFit.cover,
                ),
              ),
              // This gradient fades the bottom of the image smoothly into the surface color
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      surfaceColor.withValues(alpha: 0.5),
                      surfaceColor, // Matches the scaffold background
                    ],
                    stops: const [0.6, 0.85, 1.0],
                  ),
                ),
              ),
            ),
          ),

          // FOREGROUND CONTENT
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16),

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
                              text: 'NG',
                              style: TextStyle(color: onSurfaceColor),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const Spacer(), // Pushes everything below it to the bottom
                  // HEADLINE
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'PlusJakartaSans',
                        fontSize: 42, // display-lg adjusted for mobile screen
                        fontWeight: FontWeight.w800,
                        height: 1.1,
                        color: onSurfaceColor,
                      ),
                      children: [
                        TextSpan(text: 'Stabilize '),
                        TextSpan(
                          text: 'Fast\n',
                          style: TextStyle(color: primaryColor),
                        ),
                        TextSpan(text: 'in Your New\nCity'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 16), // Spacing token 3
                  // SUBTITLE
                  const Text(
                    'Relocating for service or work? We handle the logistics so you can thrive.',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      color: onSurfaceVariant,
                      height: 1.6, // Generous line height
                    ),
                  ),

                  const SizedBox(
                    height: 48,
                  ), // Spacing token 16 (bottom clearance)
                  // PRIMARY HERO BUTTON
                  Container(
                    width: double.infinity,
                    height: 56, // Large min-height
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24), // xl radius
                      gradient: const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight, // 135-degree angle
                        colors: [primaryColor, primaryContainer],
                      ),
                      boxShadow: [
                        // Ambient Shadow (24px blur, 0 offset, 6% opacity)
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
                            builder: (context) => const SignUpScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.transparent, // Let the gradient show
                        shadowColor: Colors
                            .transparent, // Disable default material shadow
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Get Started',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 18, // title-md
                              fontWeight: FontWeight.w700,
                              color: Colors.white, // on_primary
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32), // Bottom padding
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
