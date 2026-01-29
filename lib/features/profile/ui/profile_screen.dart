import 'package:flutter/material.dart';
import 'profile_header.dart';
import 'profile_stats.dart';
import 'user_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('raonson'),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
        ],
      ),
      body: ListView(
        children: const [
          ProfileHeader(),
          SizedBox(height: 12),
          ProfileStats(),
          SizedBox(height: 12),
          UserPostsGrid(),
        ],
      ),
    );
  }
}
