import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text(
          'Raonson',
          style: TextStyle(
            color: Colors.blueAccent,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [
          Icon(Icons.search, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Container(
              padding: const EdgeInsets.all(2),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlue],
                ),
              ),
              child: const CircleAvatar(
                backgroundColor: Color(0xFF0B0F1A),
                child: Icon(Icons.person, color: Colors.white),
              ),
            ),
            title: const Text(
              'username',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Last message preview...',
              style: TextStyle(color: Colors.white54),
            ),
            trailing: const Text(
              '12:45',
              style: TextStyle(color: Colors.white38, fontSize: 12),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const ChatScreen(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
