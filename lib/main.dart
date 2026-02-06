import 'package:flutter/material.dart';
import 'screens/home/home_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/chat/chat_screen.dart';
import 'screens/profile/profile_screen.dart';

void main() => runApp(const RaonsonApp());

class RaonsonApp extends StatefulWidget {
  const RaonsonApp({super.key});
  @override
  State<RaonsonApp> createState() => _RaonsonAppState();
}

class _RaonsonAppState extends State<RaonsonApp> {
  int i = 0;
  final pages = const [
    HomeScreen(),
    SearchScreen(),
    ChatScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: pages[i],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: i,
          onTap: (v) => setState(() => i = v),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Chat"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
