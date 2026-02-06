import 'package:flutter/material.dart';
import '../../services/chat_service.dart';

class ChatDetailScreen extends StatefulWidget {
  final String conversationId;
  final String toUserId;

  const ChatDetailScreen({
    super.key,
    required this.conversationId,
    required this.toUserId,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat")),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List>(
              future: ChatService.getMessages(widget.conversationId),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final messages = snap.data!;
                return ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (_, i) {
                    final m = messages[i];
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.all(6),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade700,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(m["text"]),
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
                      const InputDecoration(hintText: "Message"),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () async {
                  if (controller.text.isEmpty) return;
                  await ChatService.sendMessage(
                    widget.toUserId,
                    controller.text,
                  );
                  controller.clear();
                  setState(() {});
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
