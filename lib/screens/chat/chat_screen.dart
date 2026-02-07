import 'package:flutter/material.dart';

/// =======================================
/// CHAT DETAIL SCREEN – RAONSON v2 (FULL)
/// =======================================

class ChatScreen extends StatefulWidget {
  final String username;

  const ChatScreen({
    super.key,
    required this.username,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _input = TextEditingController();
  final ScrollController _scroll = ScrollController();

  final List<_Message> messages = [
    _Message(text: 'Hello 👋', mine: false),
    _Message(text: 'Hi!', mine: true),
    _Message(text: 'How are you?', mine: false),
  ];

  @override
  void dispose() {
    _input.dispose();
    _scroll.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: Colors.blueAccent,
              child: Icon(Icons.person, size: 16),
            ),
            const SizedBox(width: 8),
            Text(widget.username),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(child: _messages()),
          _inputBar(),
        ],
      ),
    );
  }

  // -------------------------------
  // MESSAGES LIST
  // -------------------------------
  Widget _messages() {
    return ListView.builder(
      controller: _scroll,
      padding: const EdgeInsets.all(12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return Align(
          alignment:
              msg.mine ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            constraints: const BoxConstraints(maxWidth: 280),
            decoration: BoxDecoration(
              color: msg.mine
                  ? Colors.blueAccent
                  : const Color(0xFF1C2333),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(msg.text),
          ),
        );
      },
    );
  }

  // -------------------------------
  // INPUT BAR
  // -------------------------------
  Widget _inputBar() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _input,
                decoration: InputDecoration(
                  hintText: 'Message...',
                  filled: true,
                  fillColor: Colors.white10,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: _send,
            ),
          ],
        ),
      ),
    );
  }

  // -------------------------------
  // SEND MESSAGE
  // -------------------------------
  void _send() {
    if (_input.text.trim().isEmpty) return;

    setState(() {
      messages.add(
        _Message(text: _input.text.trim(), mine: true),
      );
      _input.clear();
    });

    Future.delayed(const Duration(milliseconds: 100), () {
      _scroll.jumpTo(_scroll.position.maxScrollExtent);
    });
  }
}

/// =======================================
/// MESSAGE MODEL
/// =======================================

class _Message {
  final String text;
  final bool mine;

  _Message({
    required this.text,
    required this.mine,
  });
}
