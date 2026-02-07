import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String username;

  const ChatScreen({super.key, required this.username});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<_Message> messages = [
    _Message(text: 'Hello 👋', fromMe: false),
    _Message(text: 'Hi! How are you?', fromMe: true),
    _Message(text: 'I’m good, working on Raonson 🔥', fromMe: false),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: _appBar(),
      body: Column(
        children: [
          Expanded(child: _messages()),
          _inputBar(),
        ],
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person),
          ),
          const SizedBox(width: 8),
          Text(
            widget.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: const [
        Icon(Icons.call),
        SizedBox(width: 16),
        Icon(Icons.videocam),
        SizedBox(width: 12),
      ],
    );
  }

  Widget _messages() {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: messages.length,
      itemBuilder: (context, index) {
        final msg = messages[index];
        return _messageBubble(msg);
      },
    );
  }

  Widget _messageBubble(_Message msg) {
    final align =
        msg.fromMe ? Alignment.centerRight : Alignment.centerLeft;
    final color = msg.fromMe
        ? Colors.blueAccent
        : const Color(0xFF1C2333);

    return Align(
      alignment: align,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Text(msg.text),
      ),
    );
  }

  Widget _inputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF1C2333),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Message...',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (_controller.text.trim().isEmpty) return;
              setState(() {
                messages.add(
                  _Message(text: _controller.text, fromMe: true),
                );
                _controller.clear();
              });
            },
          ),
        ],
      ),
    );
  }
}

class _Message {
  final String text;
  final bool fromMe;

  _Message({required this.text, required this.fromMe});
}
