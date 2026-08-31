import 'package:flutter/material.dart';
import 'package:stabilize_workforce/features/onboarding/onboarding.dart';

void main() {
  runApp(const StabilizeWorkforceApp());
}

class StabilizeWorkforceApp extends StatelessWidget {
  const StabilizeWorkforceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stabilize Workforce',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF006B32),
          primary: const Color(0xFF006B32),
        ),
        fontFamily: 'Inter',
      ),
      home: const WorkforceHero(),
    );
  }
}

