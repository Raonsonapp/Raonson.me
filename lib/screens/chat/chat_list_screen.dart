import 'package:flutter/material.dart';
import '../../core/api.dart';
import '../../core/http_client.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  List chats = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadChats();
  }

  Future<void> loadChats() async {
    final data = await HttpClient.get(
      '${ApiConfig.baseUrl}/chat',
    );

    setState(() {
      chats = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text('Chats'),
      ),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: chats.length,
              itemBuilder: (c, i) {
                final chat = chats[i];
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.blueAccent,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    chat['username'],
                    style: const TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    chat['last_message'] ?? '',
                    style: const TextStyle(color: Colors.white54),
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ChatScreen(
                          username: chat['username'],
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
