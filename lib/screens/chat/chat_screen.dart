import 'package:flutter/material.dart';
import '../../services/socket_service.dart';
import '../../core/session.dart';

class ChatScreen extends StatefulWidget {
  final String peer;
  const ChatScreen({super.key, required this.peer});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _input = TextEditingController();
  final _messages = <String>[];
  final _socket = SocketService();
  String me = '';

  @override
  void initState() {
    super.initState();
    _init();
  }

  Future<void> _init() async {
    me = await Session.username() ?? 'user';
    await _socket.connect(me);
    _socket.messages().listen((data) {
      setState(() => _messages.add(data));
    });
  }

  @override
  void dispose() {
    _input.dispose();
    _socket.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        title: Text(widget.peer),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (_, i) {
                final parts = _messages[i].split(':');
                final from = parts.first;
                final text = parts.sublist(1).join(':');
                final mine = from == me;
                return Align(
                  alignment:
                      mine ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    decoration: BoxDecoration(
                      color: mine
                          ? Colors.blueAccent
                          : const Color(0xFF1C2333),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(text),
                  ),
                );
              },
            ),
          ),
          _inputBar(),
        ],
      ),
    );
  }

  Widget _inputBar() {
    return SafeArea(
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
            onPressed: () {
              if (_input.text.trim().isEmpty) return;
              _socket.send(widget.peer, _input.text.trim());
              _input.clear();
            },
          ),
        ],
      ),
    );
  }
}
