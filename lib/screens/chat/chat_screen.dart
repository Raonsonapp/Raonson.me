import 'package:flutter/material.dart';
import '../../core/session.dart';
import '../../services/socket_service.dart';

class ChatScreen extends StatefulWidget {
  final String peer;
  const ChatScreen({super.key, required this.peer});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _input = TextEditingController();
  final ScrollController _scroll = ScrollController();
  final SocketService _socket = SocketService();

  String me = '';
  bool connected = false;

  final List<_Message> messages = [];

  @override
  void initState() {
    super.initState();
    _connect();
  }

  Future<void> _connect() async {
    me = await Session.username() ?? '';
    await _socket.connect(me);

    _socket.stream().listen((data) {
      final parts = data.split(':');
      if (parts.length < 2) return;

      final from = parts.first;
      final text = parts.sublist(1).join(':');

      setState(() {
        messages.add(
          _Message(
            from: from,
            text: text,
            mine: from == me,
          ),
        );
      });

      _scrollToBottom();
    });

    setState(() => connected = true);
  }

  @override
  void dispose() {
    _input.dispose();
    _scroll.dispose();
    _socket.close();
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

  // ================= APP BAR =================
  AppBar _appBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 16,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 18),
          ),
          const SizedBox(width: 8),
          Text(widget.peer),
        ],
      ),
      actions: const [
        Icon(Icons.call_outlined),
        SizedBox(width: 16),
        Icon(Icons.videocam_outlined),
        SizedBox(width: 12),
      ],
    );
  }

  // ================= MESSAGES =================
  Widget _messages() {
    if (!connected) {
      return const Center(child: CircularProgressIndicator());
    }

    return ListView.builder(
      controller: _scroll,
      padding: const EdgeInsets.all(12),
      itemCount: messages.length,
      itemBuilder: (_, i) {
        final m = messages[i];
        return Align(
          alignment:
              m.mine ? Alignment.centerRight : Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 4),
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
            decoration: BoxDecoration(
              color: m.mine
                  ? Colors.blueAccent
                  : const Color(0xFF141B2D),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Text(
              m.text,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        );
      },
    );
  }

  // ================= INPUT =================
  Widget _inputBar() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _input,
                decoration: const InputDecoration(
                  hintText: 'Message...',
                  filled: true,
                  fillColor: Colors.white10,
                  border: InputBorder.none,
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

  void _send() {
    if (_input.text.trim().isEmpty) return;

    _socket.send(widget.peer, _input.text.trim());

    setState(() {
      messages.add(
        _Message(
          from: me,
          text: _input.text.trim(),
          mine: true,
        ),
      );
    });

    _input.clear();
    _scrollToBottom();
  }

  void _scrollToBottom() {
    Future.delayed(const Duration(milliseconds: 100), () {
      if (_scroll.hasClients) {
        _scroll.animateTo(
          _scroll.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }
}

// ================= MESSAGE MODEL =================
class _Message {
  final String from;
  final String text;
  final bool mine;

  _Message({
    required this.from,
    required this.text,
    required this.mine,
  });
}
