import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/reels/reels_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  final screens = const [
    HomeScreen(),
    ReelsScreen(),
    SizedBox(), // Add (later)
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: screens[index],
      bottomNavigationBar: Container(
        height: 70,
        decoration: BoxDecoration(
          color: const Color(0xFF0B0F1A),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.35),
              blurRadius: 25,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _item(Icons.home_outlined, Icons.home, 0),
            _item(Icons.play_circle_outline, Icons.play_circle, 1),
            _addButton(),
            _item(Icons.search, Icons.search, 3),
            _item(Icons.person_outline, Icons.person, 4),
          ],
        ),
      ),
    );
  }

  Widget _item(IconData icon, IconData active, int i) {
    final activeTab = index == i;
    return GestureDetector(
      onTap: () => setState(() => index = i),
      child: Icon(
        activeTab ? active : icon,
        color: activeTab ? Colors.blueAccent : Colors.white54,
        size: 26,
      ),
    );
  }

  Widget _addButton() {
    return GestureDetector(
      onTap: () {
        // Add Post (қадами дигар)
      },
      child: Container(
        width: 54,
        height: 54,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlue],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.6),
              blurRadius: 20,
              spreadRadius: 4,
            ),
          ],
        ),
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 32,
        ),
      ),
    );
  }
}
