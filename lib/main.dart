import 'package:flutter/material.dart';

import 'screens/home_screen.dart';
import 'screens/reels_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const RaonsonApp());
}

class RaonsonApp extends StatefulWidget {
  const RaonsonApp({super.key});

  @override
  State<RaonsonApp> createState() => _RaonsonAppState();
}

class _RaonsonAppState extends State<RaonsonApp> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    HomeScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Raonson',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Raonson'),
          centerTitle: true,
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection),
              label: 'Reels',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
