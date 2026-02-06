import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text(
          'Raonson',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        actions: const [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 16),
          Icon(Icons.favorite_border),
          SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: [
          _storyRow(),
          const Divider(color: Colors.white12),
          _postCard(
            username: 'ardamehr',
            caption: 'Good vibes ✨',
          ),
          _postCard(
            username: 'mehrat',
            caption: 'Life is beautiful 🌍',
          ),
        ],
      ),
    );
  }

  // ---------------- STORIES ----------------
  Widget _storyRow() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.purple],
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(3),
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(Icons.person),
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'user$index',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ---------------- POST ----------------
  Widget _postCard({
    required String username,
    required String caption,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header
        ListTile(
          leading: const CircleAvatar(child: Icon(Icons.person)),
          title: Text(username),
          trailing: const Icon(Icons.more_vert),
        ),

        // image placeholder
        Container(
          height: 300,
          color: Colors.black26,
          child: const Center(
            child: Icon(Icons.image, size: 80, color: Colors.white24),
          ),
        ),

        // actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: const [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: 16),
              Icon(Icons.send),
            ],
          ),
        ),

        // caption
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: '$username ',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(text: caption),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),
      ],
    );
  }
}
