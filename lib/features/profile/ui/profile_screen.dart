import 'package:flutter/material.dart';
import '../data/user_model.dart';
import 'profile_header.dart';
import 'profile_stats.dart';
import 'profile_actions.dart';
import 'user_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel(
      username: 'raonson',
      avatar: 'https://picsum.photos/200',
      bio: '🚀 Raonson official app\n🎬 Anime • Reels • AI',
      posts: 128,
      followers: 12450,
      following: 120,
      verified: true,
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Text(user.username),
            if (user.verified)
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: Icon(Icons.verified, color: Colors.blue, size: 18),
              ),
          ],
        ),
        actions: const [
          Icon(Icons.menu),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        children: [
          ProfileHeader(user: user),
          ProfileStats(user: user),
          const SizedBox(height: 8),
          const ProfileActions(),
          const Divider(),
          const UserPostsGrid(),
        ],
      ),
    );
  }
}
