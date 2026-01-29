import 'package:flutter/material.dart';
import '../data/user_model.dart';
import 'profile_header.dart';
import 'user_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel(
      id: '1',
      username: 'raonson',
      name: 'Raonson Official',
      avatar: 'https://i.pravatar.cc/150?img=12',
      bio: '🚀 Building the future\n🎬 Anime • AI • Reels',
      posts: 128,
      followers: 25400,
      following: 120,
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(user.username),
          centerTitle: false,
          actions: const [
            Icon(Icons.menu),
          ],
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.grid_on)),
              Tab(icon: Icon(Icons.person_pin_outlined)),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                ProfileHeader(user: user),
                const UserPostsGrid(),
              ],
            ),
            const Center(child: Text('Tagged posts')),
          ],
        ),
      ),
    );
  }
}
