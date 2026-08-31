import 'package:flutter/material.dart';

class WorkforceBottomNav extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const WorkforceBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF006B32);
    const Color onSurfaceVariant = Color(0xFF3D4A3E);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20,
            offset: Offset(0, -5),
          )
        ],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildNavItem(0, Icons.grid_view, 'Home', primaryColor, onSurfaceVariant),
            _buildNavItem(1, Icons.chat_bubble, 'Enquiries', primaryColor, onSurfaceVariant),
            _buildNavItem(2, Icons.calendar_today, 'Bookings', primaryColor, onSurfaceVariant),
            _buildNavItem(3, Icons.account_balance_wallet, 'Earnings', primaryColor, onSurfaceVariant),
            _buildNavItem(4, Icons.person, 'Profile', primaryColor, onSurfaceVariant),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon, String label, Color primaryColor, Color onSurfaceVariant) {
    final isActive = currentIndex == index;
    final color = isActive ? primaryColor : onSurfaceVariant.withValues(alpha: 0.4);

    return GestureDetector(
      onTap: () => onTap(index),
      behavior: HitTestBehavior.opaque, 
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isActive ? primaryColor.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: color, size: 22),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontFamily: 'Inter',
                fontSize: 10,
                fontWeight: isActive ? FontWeight.w700 : FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}