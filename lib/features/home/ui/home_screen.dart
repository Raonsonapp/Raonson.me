import 'package:flutter/material.dart';
import '../../upload/ui/upload_screen.dart';
import '../../feed/ui/post_card.dart';
import '../../stories/ui/stories_bar.dart';
import '../../../navigation/bottom_nav.dart';
import '../../search/ui/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  final pages = const [
    Center(child: Text('Feed')),
    SearchScreen(),
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
