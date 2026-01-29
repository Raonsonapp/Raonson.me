import 'package:flutter/material.dart';

import '../features/feed/ui/feed_screen.dart';
import '../features/search/ui/search_screen.dart';
import '../features/reels/ui/reels_screen.dart';
import '../features/upload/ui/upload_screen.dart';
import '../features/profile/ui/profile_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav>
    with SingleTickerProviderStateMixin {
  int _index = 0;

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(milliseconds: 250));

  final List<Widget> _pages = const [
    FeedScreen(),
    SearchScreen(),
    ReelsScreen(),
    UploadScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _index,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (i) {
          setState(() => _index = i);
          _controller.forward(from: 0);
        },
        items: [
          _item(Icons.home_filled, 0),
          _item(Icons.search, 1),
          _item(Icons.video_library, 2),
          _item(Icons.add_box_outlined, 3),
          _item(Icons.person, 4),
        ],
      ),
    );
  }

  BottomNavigationBarItem _item(IconData icon, int i) {
    final active = _index == i;
    return BottomNavigationBarItem(
      label: '',
      icon: ScaleTransition(
        scale: Tween<double>(begin: 1, end: 1.2).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        ),
        child: Icon(icon, size: active ? 28 : 24),
      ),
    );
  }
}
