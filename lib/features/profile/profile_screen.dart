import 'package:flutter/material.dart';
import 'profile_header.dart';
import 'profile_stats.dart';
import 'profile_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const [
          ProfileHeader(),
          ProfileStats(),
          SizedBox(height: 10),
          ProfilePostsGrid(),
        ],
      ),
    );
  }
}
