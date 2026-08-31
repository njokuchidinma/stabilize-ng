import 'package:flutter/material.dart';

import 'package:stabilize_workforce/features/directory/home.dart';
import 'package:stabilize_workforce/core/widgets/custom_nav_bar.dart';
import 'package:stabilize_workforce/features/directory/enquiry.dart';
import 'package:stabilize_workforce/features/directory/bookings_list.dart';
import 'package:stabilize_workforce/features/directory/earnings.dart';
import 'package:stabilize_workforce/features/directory/profile.dart';

class WorkforceMainLayout extends StatefulWidget {
  const WorkforceMainLayout({super.key});

  @override
  State<WorkforceMainLayout> createState() => _WorkforceMainLayoutState();
}

class _WorkforceMainLayoutState extends State<WorkforceMainLayout> {
  // This integer tracks which tab the artisan is currently viewing
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const WorkforceHomeScreen(),
    const WorkforceEnquiriesScreen(),
    const WorkforceBookingsListScreen(),
    const WorkforceEarningsScreen(),
    const WorkforceProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body swaps out the content based on the index
      body: _screens[_currentIndex],
      
      // The Workforce Bottom Nav is locked at the bottom
      bottomNavigationBar: WorkforceBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          // Tell Flutter to redraw the screen when a new tab is tapped
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}