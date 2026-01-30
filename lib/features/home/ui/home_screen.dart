import 'package:flutter/material.dart';
import '../../../navigation/bottom_nav.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = const [
    Center(child: Text('Feed')),
    Center(child: Text('Search')),
    Center(child: Text('Upload')),
    Center(child: Text('Reels')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: BottomNav(
        index: index,
        onTap: (i) => setState(() => index = i),
      ),
    );
  }
}
