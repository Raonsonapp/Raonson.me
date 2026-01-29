import 'package:flutter/material.dart';
import '../data/user_model.dart';
import 'user_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = UserModel(
      username: 'raonson',
      name: 'Raonson App',
      avatar: 'https://i.pravatar.cc/150?img=12',
      bio: '🚀 Next-gen social app\n🎬 Reels • Anime • AI',
      posts: 42,
      followers: 1200,
      following: 180,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(user.username),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _header(user),
            _actions(),
            const SizedBox(height: 12),
            const UserPostsGrid(),
          ],
        ),
      ),
    );
  }

  Widget _header(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: NetworkImage(user.avatar),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _stat(user.posts, 'Posts'),
                    _stat(user.followers, 'Followers'),
                    _stat(user.following, 'Following'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(user.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold)),
                Text(user.bio),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _stat(int value, String label) {
    return Column(
      children: [
        Text(value.toString(),
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label),
      ],
    );
  }

  Widget _actions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: () {},
              child: const Text('Edit Profile'),
            ),
          ),
          const SizedBox(width: 8),
          OutlinedButton(
            onPressed: () {},
            child: const Icon(Icons.person_add),
          ),
        ],
      ),
    );
  }
}
