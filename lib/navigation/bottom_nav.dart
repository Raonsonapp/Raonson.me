import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/reels/reels_screen.dart';
import '../screens/search/search_screen.dart';
import '../screens/chat/chat_list_screen.dart';
import '../screens/profile/profile_screen.dart';
import '../core/colors.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int index = 0;

  final screens = const [
    HomeScreen(),
    ChatListScreen(),
    ReelsScreen(),
    SearchScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: screens[index],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: AppColors.bg,
          boxShadow: [
            BoxShadow(
              color: AppColors.blueGlowSoft,
              blurRadius: 18,
              offset: Offset(0, -6), // glow ба боло
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: index,
          onTap: (i) => setState(() => index = i),
          backgroundColor: AppColors.bg,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: AppColors.blueGlow,
          unselectedItemColor: Colors.white38,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              activeIcon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.send_outlined),
              activeIcon: Icon(Icons.send),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline),
              activeIcon: Icon(Icons.play_circle),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              activeIcon: Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
