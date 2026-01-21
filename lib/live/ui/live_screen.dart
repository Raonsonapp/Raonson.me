import 'package:flutter/material.dart';
import '../services/live_engine.dart';
import 'live_controls.dart';
import 'live_chat_panel.dart';

class LiveScreen extends StatelessWidget {
  const LiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final engine = LiveEngine.instance;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          const Center(
            child: Icon(Icons.videocam, color: Colors.white, size: 120),
          ),
          LiveChatPanel(messages: engine.state.messages),
          LiveControls(onEnd: () {
            engine.endLive();
            Navigator.pop(context);
          }),
        ],
      ),
    );
  }
}