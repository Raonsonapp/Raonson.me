import 'package:flutter/material.dart';

class KingAIChatInput extends StatefulWidget {
  final void Function(String text) onSend;

  const KingAIChatInput({
    super.key,
    required this.onSend,
  });

  @override
  State<KingAIChatInput> createState() => _KingAIChatInputState();
}

class _KingAIChatInputState extends State<KingAIChatInput> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  hintText: 'Describe app, game, or feature...',
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.send),
              onPressed: () {
                final text = _controller.text.trim();
                if (text.isNotEmpty) {
                  widget.onSend(text);
                  _controller.clear();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}