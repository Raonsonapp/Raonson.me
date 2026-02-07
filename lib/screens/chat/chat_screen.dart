import 'package:flutter/material.dart';
import '../../services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String username;

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.username,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        title: Text(widget.username),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List>(
              future: ChatService.getMessages(widget.chatId),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final msgs = snap.data!;
                return ListView.builder(
                  itemCount: msgs.length,
                  itemBuilder: (context, i) {
                    final m = msgs[i];
                    final isMe = m['me'] == true;
                    return Align(
                      alignment:
                          isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color:
                              isMe ? Colors.blueAccent : Colors.white12,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Text(m['text'] ?? ''),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration:
                      const InputDecoration(hintText: 'Message'),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () async {
                  if (controller.text.isEmpty) return;
                  await ChatService.sendMessage(
                    widget.chatId,
                    controller.text,
                  );
                  controller.clear();
                  setState(() {});
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
