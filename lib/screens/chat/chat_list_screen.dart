import 'package:flutter/material.dart';
import '../../core/session.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  String me = '';

  final List<String> users = [
    'ali',
    'sara',
    'john',
    'david',
    'emma',
    'maria',
  ];

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    me = await Session.username() ?? '';
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (_, i) {
          final u = users[i];
          if (u == me) return const SizedBox();
          return _chatTile(u);
        },
      ),
    );
  }

  // ================= APP BAR =================
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: Text(
        me,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.edit),
          onPressed: () {},
        ),
      ],
    );
  }

  // ================= CHAT TILE =================
  Widget _chatTile(String user) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.person),
      ),
      title: Text(
        user,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: const Text(
        'Tap to chat',
        style: TextStyle(color: Colors.white54),
      ),
      trailing: const Icon(Icons.camera_alt_outlined),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ChatScreen(peer: user),
          ),
        );
      },
    );
  }
}
