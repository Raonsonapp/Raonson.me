import 'package:flutter/material.dart';
import '../features/home/home_screen.dart';
import '../features/search/search_screen.dart';
import '../features/upload/upload_screen.dart';
import '../features/reels/reels_screen.dart';
import '../features/profile/profile_screen.dart';
import '../widgets/animated_bottom_bar.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({super.key});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _index = 0;

  final _screens = const [
    HomeScreen(),
    SearchScreen(),
    UploadScreen(),
    ReelsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_index],
      bottomNavigationBar: AnimatedBottomBar(
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
      ),
    );
  }
}
