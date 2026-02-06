import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        title: const Text('username'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                const CircleAvatar(radius: 40, child: Icon(Icons.person)),
                const SizedBox(width: 24),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _Stat('12', 'Posts'),
                      _Stat('1.2K', 'Followers'),
                      _Stat('300', 'Following'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('This is my bio ✨'),
          ),
          const SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.all(2),
            itemCount: 30,
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
          ),
        ],
      ),
    );
  }
}

class _Stat extends StatelessWidget {
  final String c;
  final String l;
  const _Stat(this.c, this.l);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(c, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(l, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
