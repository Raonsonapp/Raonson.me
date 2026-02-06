import 'package:flutter/material.dart';
import '../services/post_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> postsFuture;

  @override
  void initState() {
    super.initState();
    postsFuture = PostService.getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
      ),
      body: FutureBuilder<List<dynamic>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Error loading posts',
                style: TextStyle(color: Colors.white),
              ),
            );
          }

          final posts = snapshot.data ?? [];

          if (posts.isEmpty) {
            return const Center(
              child: Text(
                'No posts yet',
                style: TextStyle(color: Colors.white70),
              ),
            );
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return PostCard(
                caption: post['caption'],
                imageUrl: post['image_url'],
              );
            },
          );
        },
      ),
    );
  }
}

// =======================
// POST CARD
// =======================

class PostCard extends StatelessWidget {
  final String caption;
  final String imageUrl;

  const PostCard({
    super.key,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
          ),
          title: const Text('ardamehr'),
          trailing: const Icon(Icons.more_vert),
        ),

        Image.network(
          imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            height: 300,
            color: Colors.black12,
            child: const Center(
              child: Icon(Icons.image, size: 40),
            ),
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
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
            caption,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
