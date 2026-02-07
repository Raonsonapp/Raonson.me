import 'package:flutter/material.dart';

import '../screens/home/home_screen.dart';
import '../screens/reels/reels_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/chat/chat_list_screen.dart';
import '../screens/profile/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ChatListScreen(),
    ReelsScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      body: _screens[_index],
      bottomNavigationBar: Container(
        height: 64,
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
            _navItem(
              icon: Icons.home,
              index: 0,
            ),
            _navItem(
              icon: Icons.chat_bubble_outline,
              activeIcon: Icons.chat_bubble,
              index: 1,
            ),
            _navItem(
              icon: Icons.play_circle_outline,
              activeIcon: Icons.play_circle_fill,
              index: 2,
              isCenter: true,
            ),
            _navItem(
              icon: Icons.search,
              index: 3,
            ),
            _navItem(
              icon: Icons.person_outline,
              activeIcon: Icons.person,
              index: 4,
            ),
          ],
        ),
      ),
    );
  }

  Widget _navItem({
    required IconData icon,
    IconData? activeIcon,
    required int index,
    bool isCenter = false,
  }) {
    final bool active = _index == index;

    return GestureDetector(
      onTap: () {
        setState(() {
          _index = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: isCenter && active
            ? BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.6),
                    blurRadius: 20,
                    spreadRadius: 4,
                  ),
                ],
              )
            : null,
        child: Icon(
          active ? (activeIcon ?? icon) : icon,
          size: isCenter ? 34 : 26,
          color: active ? Colors.blueAccent : Colors.white54,
        ),
      ),
    );
  }
}
