import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ChangePinScreen extends StatelessWidget {
  const ChangePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App Bar
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Row(
                    children: [
                      const Icon(Icons.arrow_back, color: primaryColor),
                      const SizedBox(width: 16),
                      const Text(
                        'Change PIN',
                        style: TextStyle(
                          fontFamily: 'PlusJakartaSans',
                          fontSize: 18,
                          fontWeight: FontWeight.w800,
                          color: onSurfaceColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 32),

                // Pin icon header
                Center(
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: primaryColor.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.pin, color: primaryColor, size: 32),
                  ),
                ),
                const SizedBox(height: 12),
                Center(
                  child: Text(
                    'Update your 4-digit transaction PIN',
                    style: TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 13,
                      color: onSurfaceVariant.withValues(alpha: 0.7),
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Current PIN
                _buildPinSection('Current PIN', surfaceContainerHigh, onSurfaceColor, onSurfaceVariant),
                const SizedBox(height: 32),

                // New PIN
                _buildPinSection('New PIN', surfaceContainerHigh, onSurfaceColor, onSurfaceVariant),
                const SizedBox(height: 32),

                // Confirm PIN
                _buildPinSection('Confirm New PIN', surfaceContainerHigh, onSurfaceColor, onSurfaceVariant),
                const SizedBox(height: 40),

                // Update PIN button
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
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('PIN updated successfully')),
                      );
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Update PIN',
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
      ),
    );
  }

  Widget _buildPinSection(String label, Color bgColor, Color onSurface, Color variant) {
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
