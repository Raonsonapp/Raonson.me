import 'package:flutter/material.dart';
import '../../services/chat_service.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatelessWidget {
  const ChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        title: const Text('Chats'),
      ),
      body: FutureBuilder<List>(
        future: ChatService.getChats(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return const Center(child: Text('Failed to load chats'));
          }

          final chats = snap.data!;
          if (chats.isEmpty) {
            return const Center(child: Text('No chats'));
          }

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, i) {
              final c = chats[i];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text(c['username'] ?? 'user'),
                subtitle: const Text('Tap to open'),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatScreen(
                        chatId: c['id'].toString(),
                        username: c['username'] ?? 'user',
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
