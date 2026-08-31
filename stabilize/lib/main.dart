import 'package:flutter/material.dart';
import 'package:stabilize/features/onboarding/onboarding.dart';
// import 'package:stabilize/features/auth/sign_up.dart';
// import 'package:stabilize/features/auth/verify.dart';
// import 'package:stabilize/features/auth/identity_verify.dart';
// Inside lib/main.dart

void main() {
  runApp(const StabilizeNgApp());
}

class StabilizeNgApp extends StatelessWidget {
  const StabilizeNgApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stabilize NG',
      debugShowCheckedModeBanner: false, // Removes the annoying red "DEBUG" banner
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Inter', // Sets Inter as the default fallback font
        // We can define global colors here later if needed,
        // but for now, our individual screens handle the design perfectly.
      ),

      // The app will now automatically start here and flow through
      // the screens when you click the buttons!
      home: const OnboardingScreen(),
    );
  }
}