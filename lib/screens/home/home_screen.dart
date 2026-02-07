import 'package:flutter/material.dart';

/// ===============================
/// HOME SCREEN – RAONSON v2
/// Pixel-perfect Instagram-style
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
      appBar: _buildAppBar(),
      body: CustomScrollView(
        slivers: [
          _buildStories(),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => _PostCard(
                data: posts[index],
                onLike: () => setState(() {}),
              ),
              childCount: posts.length,
            ),
          ),
        ],
      ),
    );
  }

  // -------------------------------
  // APP BAR
  // -------------------------------
  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: const Color(0xFF0B0F1A),
      elevation: 0,
      leadingWidth: 56,
      leading: IconButton(
        icon: const Icon(Icons.add, size: 28),
        onPressed: () {
          // TODO: Add post
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
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 14),
          child: GestureDetector(
            onTap: () {
              // TODO: Messages / Jarvis
            },
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
        ),
      ],
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
  final VoidCallback onLike;

  const _PostCard({
    required this.data,
    required this.onLike,
  });

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
        _postHeader(),
        _postMedia(),
        _postActions(),
        _postCaption(),
        const SizedBox(height: 24),
      ],
    );
  }

  Widget _postHeader() {
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

  Widget _postMedia() {
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

  Widget _postActions() {
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
              widget.onLike();
            },
          ),
          IconButton(
            icon: const Icon(Icons.chat_bubble_outline),
            onPressed: () {
              // TODO: open comments
            },
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

  Widget _postCaption() {
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
