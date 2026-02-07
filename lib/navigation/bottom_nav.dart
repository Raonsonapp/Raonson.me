import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/reels/reels_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../screens/chat/chat_list_screen.dart';
import '../screens/add/add_post_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  final List<Widget> screens = const [
    HomeScreen(),        // 0
    ReelsScreen(),       // 1
    SizedBox(),          // 2 -> Add handled separately
    SearchScreen(),      // 3
    ProfileScreen(),     // 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: screens[index],
      bottomNavigationBar: Container(
        height: 72,
        decoration: BoxDecoration(
          color: const Color(0xFF0B0F1A),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.35),
              blurRadius: 28,
              offset: const Offset(0, -6),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _navItem(
              icon: Icons.home_outlined,
              active: Icons.home,
              i: 0,
            ),
            _navItem(
              icon: Icons.play_circle_outline,
              active: Icons.play_circle,
              i: 1,
            ),
            _addButton(context),
            _navItem(
              icon: Icons.search,
              active: Icons.search,
              i: 3,
            ),
            _navItem(
              icon: Icons.person_outline,
              active: Icons.person,
              i: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    required IconData active,
    required int i,
  }) {
    final bool selected = index == i;

    return GestureDetector(
      onTap: () {
        setState(() => index = i);
      },
      child: Icon(
        selected ? active : icon,
        size: 26,
        color: selected ? Colors.blueAccent : Colors.white54,
      ),
    );
  }

  Widget _addButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const AddPostScreen(),
          ),
        );
      },
      child: Container(
        width: 56,
        height: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.lightBlue,
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent.withOpacity(0.7),
              blurRadius: 22,
              spreadRadius: 2,
            ),
          ],
        ),
        child: const Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
      ),
    );
  }
}
