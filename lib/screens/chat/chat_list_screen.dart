import 'package:flutter/material.dart';
import 'chat_screen.dart';

/// =======================================
/// CHAT LIST SCREEN – RAONSON v2 (FULL)
/// =======================================

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<_ChatItem> chats = List.generate(
    10,
    (i) => _ChatItem(
      username: 'user$i',
      lastMessage: 'Last message from user$i',
      unread: i % 3 == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text(
          'Messages',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.separated(
        itemCount: chats.length,
        separatorBuilder: (_, __) =>
            const Divider(height: 1, color: Colors.white10),
        itemBuilder: (context, index) {
          final chat = chats[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blueAccent,
              child: Text(chat.username[0].toUpperCase()),
            ),
            title: Text(
              chat.username,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(
              chat.lastMessage,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(color: Colors.white70),
            ),
            trailing: chat.unread
                ? Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                    ),
                  )
                : null,
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ChatScreen(
                    username: chat.username,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// =======================================
/// CHAT ITEM MODEL
/// =======================================

class _ChatItem {
  final String username;
  final String lastMessage;
  final bool unread;

  _ChatItem({
    required this.username,
    required this.lastMessage,
    required this.unread,
  });
}
