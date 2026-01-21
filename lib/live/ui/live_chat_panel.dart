import 'package:flutter/material.dart';
import '../models/live_message.dart';

class LiveChatPanel extends StatelessWidget {
  final List<LiveMessage> messages;

  const LiveChatPanel({required this.messages, super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        height: 250,
        width: double.infinity,
        color: Colors.black54,
        child: ListView(
          children: messages
              .map((m) => Text(
                    "${m.userId}: ${m.text}",
                    style: const TextStyle(color: Colors.white),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
