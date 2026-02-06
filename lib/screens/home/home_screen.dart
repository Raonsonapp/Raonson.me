import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text(
          'Raonson',
          style: TextStyle(fontWeight: FontWeight.w600),
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
          _stories(),
          const Divider(color: Colors.white12),
          _post('user_one', 'Beautiful day ✨'),
          _post('user_two', 'Raonson v2 UI 🔥'),
        ],
      ),
    );
  }

  Widget _stories() {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: 8,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  width: 64,
                  height: 64,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
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
                Text('user$i', style: const TextStyle(fontSize: 12)),
              ],
            ),
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
              Icon(Icons.favorite_border, size: 26),
              SizedBox(width: 18),
              Icon(Icons.chat_bubble_outline, size: 24),
              SizedBox(width: 18),
              Icon(Icons.send, size: 24),
              Spacer(),
              Icon(Icons.bookmark_border, size: 24),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: RichText(
            text: TextSpan(
              style: const TextStyle(color: Colors.white),
              children: [
                TextSpan(
                  text: '$user ',
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
