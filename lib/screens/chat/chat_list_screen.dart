import 'package:flutter/material.dart';
import '../../core/session.dart';
import '../../services/chat_service.dart';
import 'chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  bool _loading = true;
  List<dynamic> _chats = [];
  String _me = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _me = await Session.username() ?? '';
    await _loadChats();
  }

  Future<void> _loadChats() async {
    try {
      final data = await ChatService.getChats(_me);
      setState(() {
        _chats = data;
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Chats')),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : _chats.isEmpty
              ? const Center(child: Text('No chats yet'))
              : ListView.builder(
                  itemCount: _chats.length,
                  itemBuilder: (c, i) {
                    final chat = _chats[i];
                    final chatId = chat['id'];
                    final peer = chat['peer'];

                    return ListTile(
                      leading:
                          const CircleAvatar(child: Icon(Icons.person)),
                      title: Text(peer),
                      subtitle: const Text('Tap to open chat'),
                      onTap: () {
                        // 🔗 ИН ҶО ПАЙВАСТ ШУД
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ChatScreen(
                              chatId: chatId,
                              peer: peer,
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
