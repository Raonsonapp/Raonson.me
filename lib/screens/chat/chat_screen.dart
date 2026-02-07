import 'package:flutter/material.dart';
import '../../core/session.dart';
import '../../services/chat_service.dart';

class ChatScreen extends StatefulWidget {
  final String chatId;
  final String peer; // ким бо ту чат дорад

  const ChatScreen({
    super.key,
    required this.chatId,
    required this.peer,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _ctrl = TextEditingController();
  bool _loading = true;
  bool _sending = false;
  List<dynamic> _messages = [];
  String _me = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    _me = await Session.username() ?? '';
    await _load();
  }

  Future<void> _load() async {
    try {
      final data = await ChatService.getMessages(widget.chatId);
      setState(() {
        _messages = data;
        _loading = false;
      });
    } catch (_) {
      setState(() => _loading = false);
    }
  }

  Future<void> _send() async {
    final text = _ctrl.text.trim();
    if (text.isEmpty) return;

    setState(() => _sending = true);
    try {
      await ChatService.sendMessage(
        chatId: widget.chatId,
        from: _me,
        text: text,
      );
      _ctrl.clear();
      await _load();
    } catch (_) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to send')),
      );
    } finally {
      setState(() => _sending = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const CircleAvatar(radius: 16, child: Icon(Icons.person, size: 16)),
            const SizedBox(width: 8),
            Text(widget.peer),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: _loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: _messages.length,
                    itemBuilder: (c, i) => _bubble(_messages[i]),
                  ),
          ),
          _input(),
        ],
      ),
    );
  }

  Widget _bubble(dynamic m) {
    final String from = m['from'] ?? '';
    final String text = m['text'] ?? '';
    final bool mine = from == _me;

    return Align(
      alignment: mine ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        constraints: const BoxConstraints(maxWidth: 260),
        decoration: BoxDecoration(
          color: mine ? Colors.blueAccent : const Color(0xFF1C2333),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Text(text),
      ),
    );
  }

  Widget _input() {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.white12)),
        ),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _ctrl,
                decoration: const InputDecoration(
                  hintText: 'Message…',
                  border: InputBorder.none,
                ),
              ),
            ),
            IconButton(
              icon: _sending
                  ? const SizedBox(
                      width: 18,
                      height: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.send),
              onPressed: _sending ? null : _send,
            ),
          ],
        ),
      ),
    );
  }
}
