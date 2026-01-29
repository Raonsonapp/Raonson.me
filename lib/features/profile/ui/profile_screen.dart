import 'package:flutter/material.dart';
import 'edit_profile_screen.dart';
import 'user_posts_grid.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('raonson'),
        actions: const [
          Icon(Icons.menu),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          // Header
          Row(
            children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.grey,
                child: Icon(Icons.person, size: 40),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    _StatItem(title: 'Posts', value: '24'),
                    _StatItem(title: 'Followers', value: '1.2K'),
                    _StatItem(title: 'Following', value: '180'),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Username + bio
          const Text(
            'Raonson Official',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          const Text(
            'Next generation social app 🚀\nAnime • Reels • AI',
          ),

          const SizedBox(height: 12),

          // Edit profile
          OutlinedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const EditProfileScreen(),
                ),
              );
            },
            child: const Text('Edit profile'),
          ),

          const SizedBox(height: 12),

          // Posts grid
          const UserPostsGrid(),
        ],
      ),
    );
  }
}

class _StatItem extends StatelessWidget {
  final String title;
  final String value;
  const _StatItem({required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        Text(title),
      ],
    );
  }
}
