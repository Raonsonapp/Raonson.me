import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.add_box_outlined),
          onPressed: () {
            // ➕ Add Post (ҚАДАМИ 5)
          },
        ),
        title: const Text(
          'Raonson',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.smart_toy_outlined), // Jarvis
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: const [
          _StoriesBar(),
          Divider(color: Colors.white24),
          _PostPlaceholder(),
          _PostPlaceholder(),
        ],
      ),
    );
  }
}

class _StoriesBar extends StatelessWidget {
  const _StoriesBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        scrollDirection: Axis.horizontal,
        itemBuilder: (_, i) => Column(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.blueAccent,
              child: CircleAvatar(
                radius: 26,
                backgroundColor: const Color(0xFF0B0F1A),
                child: Text(
                  'U$i',
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 6),
            Text('user$i',
                style: const TextStyle(color: Colors.white70, fontSize: 12)),
          ],
        ),
        separatorBuilder: (_, __) => const SizedBox(width: 12),
        itemCount: 10,
      ),
    );
  }
}

class _PostPlaceholder extends StatelessWidget {
  const _PostPlaceholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(child: Text('U')),
          title: const Text('username',
              style: TextStyle(color: Colors.white)),
          trailing: IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ),
        Container(
          height: 260,
          color: Colors.white10,
          alignment: Alignment.center,
          child: const Icon(Icons.image, size: 80, color: Colors.white24),
        ),
        Row(
          children: const [
            IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.white),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.chat_bubble_outline, color: Colors.white),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(Icons.send_outlined, color: Colors.white),
              onPressed: null,
            ),
            Spacer(),
            IconButton(
              icon: Icon(Icons.bookmark_border, color: Colors.white),
              onPressed: null,
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          child: Text('Description…',
              style: TextStyle(color: Colors.white70)),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}
