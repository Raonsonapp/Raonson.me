import 'package:flutter/material.dart';
import '../features/feed/ui/feed_screen.dart';
import '../features/search/ui/search_screen.dart';
import '../features/upload/ui/upload_screen.dart';
import '../features/reels/ui/reels_screen.dart';
import '../features/profile/ui/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _index = 0;

  final List<Widget> _screens = const [
    FeedScreen(),
    SearchScreen(),
    UploadScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_box_outlined), label: "Upload"),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_outline), label: "Reels"),
          BottomNavigationBarItem(
              icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
    );
  }
}
