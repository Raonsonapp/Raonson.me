import 'package:flutter/material.dart';
import '../services/post_service.dart';
import 'comments_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<dynamic>> _postsFuture;

  @override
  void initState() {
    super.initState();
    _postsFuture = PostService.getPosts();
  }

  Future<void> _refresh() async {
    setState(() {
      _postsFuture = PostService.getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 12),
            child: Icon(Icons.add_box_outlined),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: FutureBuilder<List<dynamic>>(
          future: _postsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Failed to load posts',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            final posts = snapshot.data ?? [];

            if (posts.isEmpty) {
              return const Center(
                child: Text(
                  'No posts yet',
                  style: TextStyle(color: Colors.white70),
                ),
              );
            }

            return ListView.builder(
              physics: const AlwaysScrollableScrollPhysics(),
              itemCount: posts.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return const _StoriesBar();
                }

                final post = posts[index - 1];

                return PostCard(
                  postId: post['id'],
                  caption: post['caption'] ?? '',
                  imageUrl: post['image_url'] ?? '',
                );
              },
            );
          },
        ),
      ),
    );
  }
}

//
// =======================
// STORIES BAR
// =======================
//

class _StoriesBar extends StatelessWidget {
  const _StoriesBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 105,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF4FC3F7),
                        Color(0xFF1E88E5),
                      ],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundImage:
                        NetworkImage('https://i.pravatar.cc/150'),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'user',
                  style: TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

//
// =======================
// POST CARD (SAFE VERSION)
// =======================
//

class PostCard extends StatefulWidget {
  final int postId;
  final String caption;
  final String imageUrl;

  const PostCard({
    super.key,
    required this.postId,
    required this.caption,
    required this.imageUrl,
  });

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  bool liked = false;
  bool loadingLike = false;

  Future<void> _like() async {
    if (loadingLike) return;

    setState(() {
      liked = true;
      loadingLike = true;
    });

    try {
      await PostService.likePost(widget.postId);
    } catch (_) {
      setState(() => liked = false);
    } finally {
      loadingLike = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: const CircleAvatar(
            backgroundImage: NetworkImage('https://i.pravatar.cc/150'),
          ),
          title: const Text('ardamehr'),
          trailing: const Icon(Icons.more_vert),
        ),

        widget.imageUrl.isNotEmpty
            ? Image.network(
                widget.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => _imagePlaceholder(),
              )
            : _imagePlaceholder(),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: [
              GestureDetector(
                onTap: _like,
                child: Icon(
                  liked ? Icons.favorite : Icons.favorite_border,
                  color: liked ? Colors.pinkAccent : Colors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) =>
                          CommentsScreen(postId: widget.postId),
                    ),
                  );
                },
              ),
              const SizedBox(width: 8),
              const Icon(Icons.send),
              const Spacer(),
              const Icon(Icons.bookmark_border),
            ],
          ),
        ),

        if (widget.caption.isNotEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              widget.caption,
              style: const TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

        const SizedBox(height: 20),
      ],
    );
  }

  Widget _imagePlaceholder() {
    return Container(
      height: 300,
      color: Colors.white10,
      child: const Center(
        child: Icon(Icons.image, size: 40),
      ),
    );
  }
}
