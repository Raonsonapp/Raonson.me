import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Messages'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.edit),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: 12,
        itemBuilder: (context, index) {
          return const ChatTile();
        },
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  const ChatTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: const LinearGradient(
            colors: [
              Color(0xFF4FC3F7),
              Color(0xFF1E88E5),
            ],
          ),
        ),
        child: const CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
        ),
      ),
      title: const Text(
        'ardamehr',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      subtitle: const Text(
        'Hey, how are you?',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.white60),
      ),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 10,
            height: 10,
            decoration: const BoxDecoration(
              color: Color(0xFF4FC3F7),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            '2m',
            style: TextStyle(fontSize: 11, color: Colors.white54),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ChatDetailScreen(),
          ),
        );
      },
    );
  }
}

// =======================
// CHAT DETAIL (MESSAGES)
// =======================

class ChatDetailScreen extends StatelessWidget {
  const ChatDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            CircleAvatar(
              radius: 16,
              backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
            ),
            SizedBox(width: 8),
            Text('ardamehr'),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: const [
                _MessageBubble(
                  text: 'Hello 👋',
                  isMe: false,
                ),
                _MessageBubble(
                  text: 'Hey! What’s up?',
                  isMe: true,
                ),
                _MessageBubble(
                  text: 'Raonson is looking fire 🔥',
                  isMe: false,
                ),
              ],
            ),
          ),
          const _MessageInput(),
        ],
      ),
    );
  }
}

class _MessageBubble extends StatelessWidget {
  final String text;
  final bool isMe;

  const _MessageBubble({
    required this.text,
    required this.isMe,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: isMe
              ? const Color(0xFF1E88E5)
              : Colors.white10,
          borderRadius: BorderRadius.circular(18),
          boxShadow: isMe
              ? [
                  BoxShadow(
                    color: const Color(0xFF4FC3F7).withOpacity(0.6),
                    blurRadius: 12,
                  ),
                ]
              : [],
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class _MessageInput extends StatelessWidget {
  const _MessageInput();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: const BoxDecoration(
        color: Color(0xFF0A0F1F),
      ),
      child: Row(
        children: [
          const Icon(Icons.add, color: Colors.white54),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Message...',
                hintStyle: const TextStyle(color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            Icons.send,
            color: Color(0xFF4FC3F7),
          ),
        ],
      ),
    );
  }
}
