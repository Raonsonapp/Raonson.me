import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Raonson',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          // ===== STORIES =====
          SizedBox(
            height: 110,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 32,
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=$index',
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'user$index',
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          const Divider(),

          // ===== POSTS =====
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 5,
            itemBuilder: (context, index) {
              return _PostCard(index: index);
            },
          ),
        ],
      ),
    );
  }
}

// ================= POST CARD =================

class _PostCard extends StatelessWidget {
  final int index;

  const _PostCard({required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // HEADER
        ListTile(
          leading: CircleAvatar(
            backgroundImage:
                NetworkImage('https://i.pravatar.cc/150?img=$index'),
          ),
          title: Text('user$index'),
          trailing: const Icon(Icons.more_vert),
        ),

        // IMAGE / VIDEO PLACEHOLDER
        Container(
          height: 300,
          color: Colors.grey.shade300,
          child: const Center(
            child: Icon(Icons.play_arrow, size: 60),
          ),
        ),

        // ACTIONS
        Row(
          children: [
            IconButton(
              icon: const Icon(Icons.favorite_border),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.comment_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {},
            ),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.bookmark_border),
              onPressed: () {},
            ),
          ],
        ),

        // LIKES
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            '1,234 likes',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),

        // CAPTION
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: RichText(
            text: const TextSpan(
              style: TextStyle(color: Colors.black),
              children: [
                TextSpan(
                  text: 'user ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: 'This is a demo post on Raonson 🔥'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 12),
      ],
    );
  }
}
