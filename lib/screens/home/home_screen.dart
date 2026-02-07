import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          _stories(),
          const SizedBox(height: 8),
          _postCard(),
          _postCard(),
        ],
      ),
    );
  }

  // ───────────────── APP BAR ─────────────────
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.add, size: 28),
        onPressed: () {},
      ),
      centerTitle: true,
      title: const Text(
        'Raonson',
        style: TextStyle(
          fontFamily: 'cursive',
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 12),
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Colors.blueAccent,
            child: const Icon(Icons.smart_toy, color: Colors.white),
          ),
        ),
      ],
    );
  }

  // ───────────────── STORIES ─────────────────
  Widget _stories() {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: 6,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.blue, Colors.cyanAccent],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.6),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFF1C2333),
                    child: Icon(Icons.person, size: 30),
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

  // ───────────────── POST ─────────────────
  Widget _postCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        ListTile(
          leading: const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person),
          ),
          title: const Text('username'),
          trailing: const Icon(Icons.more_vert),
        ),

        // Image
        Container(
          height: 360,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color(0xFF1C2333),
          ),
          child: const Center(
            child: Icon(Icons.image, size: 80, color: Colors.white24),
          ),
        ),

        // Actions
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
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
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'This is a caption example for Raonson post.',
            style: TextStyle(color: Colors.white70),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
