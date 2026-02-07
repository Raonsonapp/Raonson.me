import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),

      // ===== TOP BAR =====
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'Raonson',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.add_box_outlined),
          onPressed: () {
            // add post later
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.smart_toy_outlined), // Jarvis
            onPressed: () {},
          ),
        ],
      ),

      // ===== BODY =====
      body: ListView(
        children: [
          _stories(),
          const Divider(color: Colors.white12),
          _post(),
          _post(),
        ],
      ),
    );
  }

  // ===== STORIES =====
  Widget _stories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 28,
                  backgroundColor: Colors.blueAccent,
                  child: const CircleAvatar(
                    radius: 26,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.person),
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

  // ===== POST CARD =====
  Widget _post() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ListTile(
          leading: CircleAvatar(child: Icon(Icons.person)),
          title: Text('username'),
          trailing: Icon(Icons.more_vert),
        ),

        Container(
          height: 280,
          color: Colors.black26,
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

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            'This is a Raonson post',
            style: TextStyle(color: Colors.white70),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
