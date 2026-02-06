import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text('Chats'),
        actions: const [
          Icon(Icons.edit),
          SizedBox(width: 16),
        ],
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            leading: const CircleAvatar(
              radius: 22,
              child: Icon(Icons.person),
            ),
            title: Text(
              'user$index',
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
            subtitle: const Text(
              'Last message preview...',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(username: 'user$index'),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
