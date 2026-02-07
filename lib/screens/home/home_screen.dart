import 'package:flutter/material.dart';
import '../add/add_screen.dart';

/// ===============================
/// HOME SCREEN – RAONSON v2
/// FULL VERSION (NO MISSING PARTS)
/// ===============================

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // -------------------------------
  // MOCK DATA (ба сервер иваз мешавад)
  // -------------------------------
  final List<_StoryUser> stories = List.generate(
    8,
    (i) => _StoryUser(username: 'user$i'),
  );

  final List<_PostData> posts = List.generate(
    5,
    (i) => _PostData(
      username: 'user$i',
      caption: 'This is a Raonson post caption number $i',
      likes: 1200 + i * 37,
    ),
  );

  // -------------------------------
  // BUILD
  // -------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),

      // ===== APP BAR =====
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,

        // 🔹 (+) ДАР ИН ҶО АСТ (ЧАПИ БОЛО)
        leading: IconButton(
          icon: const Icon(Icons.add, size: 28),
          onPressed: () {
            // ⬇⬇⬇ ИН ҶО + КОР МЕКУНАД ⬇⬇⬇
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const AddPostScreen(),
              ),
            );
          },
        ),

        centerTitle: true,
        title: const Text(
          'Raonson',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.5,
          ),
        ),

        // 🔹 JARVIS (ROST)
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 14),
            child: Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.cyanAccent],
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.blueAccent.withOpacity(0.6),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: const Icon(Icons.smart_toy, size: 20),
            ),
          ),
        ],
      ),

      // ===== BODY =====
      body: CustomScrollView(
        slivers: [
          _buildStories(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _PostCard(data: posts[index]),
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // STORIES
  // -------------------------------
  Widget _buildStories() {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 110,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          itemCount: stories.length,
          itemBuilder: (context, index) {
            return _StoryBubble(user: stories[index]);
          },
        ),
      ),
    );
  }
}

/// ===============================
/// STORY BUBBLE
/// ===============================
class _StoryBubble extends StatelessWidget {
  final _StoryUser user;

  const _StoryBubble({required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Colors.blue, Colors.cyanAccent],
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.blueAccent.withOpacity(0.7),
                  blurRadius: 10,
                ),
              ],
            ),
            child: const CircleAvatar(
              radius: 30,
              backgroundColor: Color(0xFF1C2333),
              child: Icon(Icons.person, size: 30),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            user.username,
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

/// ===============================
/// POST CARD
/// ===============================
class _PostCard extends StatefulWidget {
  final _PostData data;

  const _PostCard({required this.data});

  @override
  State<_PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<_PostCard> {
  bool liked = false;
  bool saved = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(),
        _media(),
        _actions(),
        _caption(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _header() {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Colors.blueAccent,
        child: Icon(Icons.person),
      ),
      title: Text(
        widget.data.username,
        style: const TextStyle(fontWeight: FontWeight.w600),
      ),
      trailing: const Icon(Icons.more_vert),
    );
  }

  Widget _media() {
    return Container(
      height: 360,
      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2333),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Center(
        child: Icon(Icons.image, size: 90, color: Colors.white24),
      ),
    );
  }

  Widget _actions() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Row(
        children: [
          IconButton(
            icon: Icon(
              liked ? Icons.favorite : Icons.favorite_border,
              color: liked ? Colors.redAccent : Colors.white,
            ),
            onPressed: () {
              setState(() {
                liked = !liked;
                widget.data.likes += liked ? 1 : -1;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {},
          ),
          const Spacer(),
          IconButton(
            icon: Icon(
              saved ? Icons.bookmark : Icons.bookmark_border,
            ),
            onPressed: () {
              setState(() => saved = !saved);
            },
          ),
        ],
      ),
    );
  }

  Widget _caption() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.data.username,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const TextSpan(text: '  '),
            TextSpan(
              text: widget.data.caption,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
        ),
      ),
    );
  }
}

/// ===============================
/// DATA MODELS (LOCAL)
/// ===============================
class _StoryUser {
  final String username;
  _StoryUser({required this.username});
}

class _PostData {
  final String username;
  final String caption;
  int likes;

  _PostData({
    required this.username,
    required this.caption,
    required this.likes,
  });
}
