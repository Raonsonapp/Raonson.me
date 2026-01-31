import '../../upload/ui/upload_screen.dart';
import '../../feed/ui/post_card.dart';
import '../../stories/ui/stories_bar.dart';
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
    UploadScreen(),
    Center(child: Text('Reels')),
    Center(child: Text('Profile')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
  children: const [
    StoriesBar(),
    Divider(height: 1),
    Expanded(
  child: ListView(
    children: const [
      PostCard(),
      PostCard(),
      PostCard(),
    ],
  ),
),
