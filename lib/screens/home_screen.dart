import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: ListView(
        children: const [
          SizedBox(height: 10),
          StoriesBar(),
          Divider(color: Colors.white12),
          PostCard(),
          PostCard(),
        ],
      ),
    );
  }
}
class StoriesBar extends StatelessWidget {
  const StoriesBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF4FC3F7), Color(0xFF1E88E5)],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150'),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'user',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
class PostCard extends StatelessWidget {
  const PostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
          ),
          title: const Text('ardamehr'),
          trailing: const Icon(Icons.more_vert),
        ),

        // Image
        Image.network(
          'https://picsum.photos/500/500',
          fit: BoxFit.cover,
        ),

        // Actions
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

        // Caption
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'ardamehr  Sunset vibes 🌅',
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
