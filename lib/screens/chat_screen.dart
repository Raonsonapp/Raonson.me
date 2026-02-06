import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: const [
          Icon(Icons.video_call_outlined),
          SizedBox(width: 16),
          Icon(Icons.edit_outlined),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          const _NotesBar(),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: mockChats.length,
              itemBuilder: (context, index) {
                return _ChatTile(chat: mockChats[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- NOTES BAR ---------------- */

class _NotesBar extends StatelessWidget {
  const _NotesBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: mockNotes.length,
        itemBuilder: (context, index) {
          final note = mockNotes[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12, top: 12),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: const Color(0xFF1E88E5),
                  child: CircleAvatar(
                    radius: 24,
                    backgroundImage: NetworkImage(note.avatar),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  note.text,
                  style: const TextStyle(fontSize: 11),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ---------------- CHAT TILE ---------------- */

class _ChatTile extends StatelessWidget {
  final Chat chat;

  const _ChatTile({required this.chat});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(chat.avatar),
        radius: 24,
      ),
      title: Text(
        chat.username,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        chat.lastMessage,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(color: Colors.white70),
      ),
      trailing: Text(
        chat.time,
        style: const TextStyle(color: Colors.white54, fontSize: 12),
      ),
      onTap: () {
        // Later: open chat detail screen
      },
    );
  }
}

/* ---------------- MOCK DATA ---------------- */

class Note {
  final String avatar;
  final String text;

  Note(this.avatar, this.text);
}

class Chat {
  final String username;
  final String avatar;
  final String lastMessage;
  final String time;

  Chat({
    required this.username,
    required this.avatar,
    required this.lastMessage,
    required this.time,
  });
}

final mockNotes = [
  Note('https://i.pravatar.cc/150?img=1', 'Hi 👋'),
  Note('https://i.pravatar.cc/150?img=2', 'Music 🎵'),
  Note('https://i.pravatar.cc/150?img=3', 'Busy'),
  Note('https://i.pravatar.cc/150?img=4', 'At work'),
];

final mockChats = [
  Chat(
    username: 'alex',
    avatar: 'https://i.pravatar.cc/150?img=2',
    lastMessage: 'Let’s meet tonight',
    time: '2m',
  ),
  Chat(
    username: 'lina',
    avatar: 'https://i.pravatar.cc/150?img=3',
    lastMessage: 'Send me the photo',
    time: '15m',
  ),
  Chat(
    username: 'mark',
    avatar: 'https://i.pravatar.cc/150?img=4',
    lastMessage: 'Okay 👍',
    time: '1h',
  ),
];
