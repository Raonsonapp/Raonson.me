import 'package:flutter/material.dart';
import '../../models/message.dart';
import '../../services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  final String username;
  const ChatScreen({super.key, required this.username});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _text = TextEditingController();
  List<Message> msgs = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    msgs = await ChatService.messages(widget.username);
    setState(() => loading = false);
  }

  Future<void> send() async {
    if (_text.text.trim().isEmpty) return;
    await ChatService.send(
      to: widget.username,
      text: _text.text.trim(),
    );
    _text.clear();
    await load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(title: Text(widget.username)),
      body: Column(
        children: [
          Expanded(
            child: loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: msgs.length,
                    itemBuilder: (_, i) {
                      final m = msgs[i];
                      final me = m.from != widget.username;
                      return Align(
                        alignment:
                            me ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: me
                                ? Colors.blueAccent
                                : Colors.white12,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            m.text,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          SafeArea(
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _text,
                    decoration: const InputDecoration(
                      hintText: 'Message...',
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 12),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: send,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
