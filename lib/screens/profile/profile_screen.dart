import 'package:flutter/material.dart';
import '../../services/user_service.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        title: const Text('Profile'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: UserService.getProfile(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return const Center(child: Text('Failed to load profile'));
          }

          final user = snap.data!;
          return ListView(
            children: [
              _header(user),
              _bio(user),
              const Divider(color: Colors.white12),
              _posts(),
            ],
          );
        },
      ),
    );
  }

  Widget _header(Map user) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const CircleAvatar(radius: 40, child: Icon(Icons.person)),
          const SizedBox(width: 24),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _stat(user['posts'] ?? '0', 'Posts'),
                _stat(user['followers'] ?? '0', 'Followers'),
                _stat(user['following'] ?? '0', 'Following'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bio(Map user) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            user['username'] ?? '',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(user['bio'] ?? ''),
        ],
      ),
    );
  }

  Widget _posts() {
    return FutureBuilder<List>(
      future: UserService.getUserPosts(),
      builder: (context, snap) {
        if (!snap.hasData) {
          return const Padding(
            padding: EdgeInsets.all(32),
            child: Center(child: CircularProgressIndicator()),
          );
        }
        final posts = snap.data!;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(2),
          itemCount: posts.length,
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          itemBuilder: (context, i) {
            return Container(
              color: Colors.white10,
              child: const Icon(Icons.image, color: Colors.white24),
            );
          },
        );
      },
    );
  }

  Widget _stat(String c, String l) {
    return Column(
      children: [
        Text(c, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(l, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
