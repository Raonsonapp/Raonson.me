import 'package:flutter/material.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final List<_ChatUser> users = List.generate(
    12,
    (i) => _ChatUser(
      username: 'user$i',
      lastMessage: 'Last message from user$i',
      online: i % 2 == 0,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return _chatTile(users[index]);
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: const Text(
        'Messages',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 14),
          child: Icon(Icons.edit),
        ),
      ],
    );
  }

  Widget _chatTile(_ChatUser user) {
    return ListTile(
      leading: Stack(
        children: [
          const CircleAvatar(
            radius: 24,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person),
          ),
          if (user.online)
            Positioned(
              bottom: 2,
              right: 2,
              child: Container(
                width: 10,
                height: 10,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.greenAccent,
                ),
              ),
            ),
        ],
      ),
      title: Text(
        user.username,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        user.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white70),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(username: user.username),
          ),
        );
      },
    );
  }
}

class _ChatUser {
  final String username;
  final String lastMessage;
  final bool online;

  _ChatUser({
    required this.username,
    required this.lastMessage,
    required this.online,
  });
}
