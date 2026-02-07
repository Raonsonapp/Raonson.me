import 'package:flutter/material.dart';
import '../screens/home/home_screen.dart';
import '../screens/chat/chat_list_screen.dart';
import '../screens/reels/reels_screen.dart';

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
    _SearchPlaceholder(),
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: const Color(0xFF0B0F1A),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            activeIcon: Icon(Icons.chat_bubble),
            label: 'Chat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_outlined),
            activeIcon: Icon(Icons.movie),
            label: 'Reels',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            activeIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// --- placeholders (қадамҳои баъдӣ пур мешаванд) ---
class _ChatPlaceholder extends StatelessWidget {
  const _ChatPlaceholder();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('CHAT (қадамҳои баъдӣ)'));
}

class _ReelsPlaceholder extends StatelessWidget {
  const _ReelsPlaceholder();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('REELS (қадамҳои баъдӣ)'));
}

class _SearchPlaceholder extends StatelessWidget {
  const _SearchPlaceholder();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('SEARCH (қадамҳои баъдӣ)'));
}

class _ProfilePlaceholder extends StatelessWidget {
  const _ProfilePlaceholder();
  @override
  Widget build(BuildContext context) =>
      const Center(child: Text('PROFILE (қадамҳои баъдӣ)'));
}
