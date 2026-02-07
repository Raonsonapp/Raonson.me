import 'package:flutter/material.dart';
import '../../services/post_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text('Raonson'),
      ),
      body: FutureBuilder<List>(
        future: PostService.getFeed(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return const Center(child: Text('Failed to load feed'));
          }

          final posts = snap.data!;
          if (posts.isEmpty) {
            return const Center(child: Text('No posts yet'));
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, i) {
              final p = posts[i];
              return _post(
                p['username'] ?? 'user',
                p['caption'] ?? '',
              );
            },
          );
        },
      ),
    );
  }

  Widget _post(String user, String caption) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(user),
          trailing: const Icon(Icons.more_vert),
        ),
        Container(
          height: 300,
          color: Colors.white10,
          child: const Center(
            child: Icon(Icons.image, size: 80, color: Colors.white24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            children: const [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: 16),
              Icon(Icons.send),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '$user $caption',
            style: const TextStyle(fontSize: 13),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }
}
