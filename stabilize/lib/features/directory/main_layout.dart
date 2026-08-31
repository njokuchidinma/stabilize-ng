import 'package:flutter/material.dart';

// Your screen imports
import 'package:stabilize/features/directory/home_screen.dart';
import 'package:stabilize/features/directory/search.dart';
import 'package:stabilize/features/directory/messages.dart'; // NEW
import 'package:stabilize/features/directory/bookings.dart';
import 'package:stabilize/features/directory/profile.dart';

import 'package:stabilize/core/widgets/nav_bar.dart'; // Or your custom nav path

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  // Start on Home
  int _currentIndex = 0;

  // Now containing all 5 tabs!
  final List<Widget> _screens = [
    const HomeScreen(),        // Index 0
    const SearchScreen(),      // Index 1
    const MessagesScreen(),    // Index 2 (NEW)
    const BookingsScreen(),    // Index 3
    const ProfileScreen(),     // Index 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: CustomBottomNav(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}