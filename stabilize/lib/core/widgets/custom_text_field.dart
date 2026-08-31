// lib/core/widgets/custom_text_field.dart
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextInputType? keyboardType;

  // We can hardcode your "Digital Patriot" colors here so you don't
  // have to pass them every time you use this widget!
  final Color surfaceContainerHigh = const Color(0xFFE7E8E9);
  final Color onSurfaceVariant = const Color(0xFF3D4A3E);

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.keyboardType,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // The Label (e.g., "First Name")
        Text(
          label,
          style: TextStyle(
            fontFamily: 'Inter',
            fontSize: 12, // label-md
            color: onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),

        // The actual text input box
        TextField(
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: onSurfaceVariant.withValues(alpha: 0.6),
              fontFamily: 'Inter',
            ),
            filled: true,
            fillColor: surfaceContainerHigh,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none, // "No-Line" rule applied globally
            ),
          ),
        ),
      ],
    );
  }
}