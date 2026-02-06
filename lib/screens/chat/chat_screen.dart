import 'package:flutter/material.dart';
import '../../services/chat_service.dart';
import 'chat_detail_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chats")),
      body: FutureBuilder<List>(
        future: ChatService.getConversations(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snap.hasError) {
            return const Center(child: Text("Error loading chats"));
          }

          final chats = snap.data!;
          if (chats.isEmpty) {
            return const Center(child: Text("No chats yet"));
          }

          return ListView.builder(
            itemCount: chats.length,
            itemBuilder: (context, i) {
              final c = chats[i];
              return ListTile(
                leading: const CircleAvatar(child: Icon(Icons.person)),
                title: Text("Chat"),
                subtitle: Text("Tap to open"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChatDetailScreen(
                        conversationId: c["id"],
                        toUserId: c["user1_id"],
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
