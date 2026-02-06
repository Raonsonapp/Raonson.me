import 'package:flutter/material.dart';
import '../services/chat_service.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  final int userId = 1; // v1: static, v2 -> from auth token

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chats"),
        actions: const [
          Icon(Icons.video_call_outlined),
          SizedBox(width: 16),
          Icon(Icons.edit_outlined),
          SizedBox(width: 12),
        ],
      ),
      body: FutureBuilder<List<dynamic>>(
        future: ChatService.getChats(userId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text("Error loading chats"));
          }

          final chats = snapshot.data!;
          if (chats.isEmpty) {
            return const Center(child: Text("No chats yet"));
          }

          return ListView.separated(
            itemCount: chats.length,
            separatorBuilder: (_, __) =>
                const Divider(height: 1, color: Colors.white12),
            itemBuilder: (context, index) {
              final chat = chats[index];
              return _ChatTile(chat: chat);
            },
          );
        },
      ),
    );
  }
}

/* ---------------- SINGLE CHAT TILE ---------------- */

class _ChatTile extends StatelessWidget {
  final Map<String, dynamic> chat;

  const _ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    final fromUser = chat["from_user"];
    final toUser = chat["to_user"];
    final message = chat["message"] ?? "";

    return ListTile(
      leading: const CircleAvatar(
        radius: 24,
        backgroundImage: NetworkImage(
          "https://i.pravatar.cc/150?img=12",
        ),
      ),
      title: Text(
        "User $fromUser",
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        message,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: const Text(
        "now",
        style: TextStyle(fontSize: 12, color: Colors.white54),
      ),
      onTap: () {
        // v2: open chat detail screen
      },
    );
  }
}
