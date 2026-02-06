import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Raonson'),
        actions: const [
          Icon(Icons.add_box_outlined),
          SizedBox(width: 16),
          Icon(Icons.send_outlined),
          SizedBox(width: 12),
        ],
      ),
      body: Column(
        children: [
          const _StoriesBar(),
          const Divider(height: 1),
          Expanded(
            child: ListView.builder(
              itemCount: mockPosts.length,
              itemBuilder: (context, index) {
                return _PostCard(post: mockPosts[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

/* ---------------- STORIES ---------------- */

class _StoriesBar extends StatelessWidget {
  const _StoriesBar();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: mockStories.length,
        itemBuilder: (context, index) {
          final story = mockStories[index];
          return Padding(
            padding: const EdgeInsets.only(right: 12, top: 10),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF4FC3F7),
                        Color(0xFF1E88E5),
                      ],
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(story.avatar),
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  story.username,
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

/* ---------------- POST CARD ---------------- */

class _PostCard extends StatelessWidget {
  final Post post;

  const _PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(post.avatar),
          ),
          title: Text(
            post.username,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: const Icon(Icons.more_vert),
        ),
        Image.network(
          post.image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 300,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            children: const [
              Icon(Icons.favorite_border),
              SizedBox(width: 16),
              Icon(Icons.chat_bubble_outline),
              SizedBox(width: 16),
              Icon(Icons.send),
              Spacer(),
              Icon(Icons.bookmark_border),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            '${post.username} ${post.caption}',
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            post.time,
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ),
        const SizedBox(height: 12),
      ],
    );
  }
}

/* ---------------- MOCK DATA ---------------- */

class Story {
  final String username;
  final String avatar;

  Story(this.username, this.avatar);
}

class Post {
  final String username;
  final String avatar;
  final String image;
  final String caption;
  final String time;

  Post({
    required this.username,
    required this.avatar,
    required this.image,
    required this.caption,
    required this.time,
  });
}

final mockStories = [
  Story('you', 'https://i.pravatar.cc/150?img=1'),
  Story('alex', 'https://i.pravatar.cc/150?img=2'),
  Story('lina', 'https://i.pravatar.cc/150?img=3'),
  Story('mark', 'https://i.pravatar.cc/150?img=4'),
  Story('sara', 'https://i.pravatar.cc/150?img=5'),
];

final mockPosts = [
  Post(
    username: 'alex',
    avatar: 'https://i.pravatar.cc/150?img=2',
    image: 'https://picsum.photos/600/600?random=1',
    caption: 'enjoying the blue vibes 💙',
    time: '2 hours ago',
  ),
  Post(
    username: 'lina',
    avatar: 'https://i.pravatar.cc/150?img=3',
    image: 'https://picsum.photos/600/600?random=2',
    caption: 'life is better at night ✨',
    time: '5 hours ago',
  ),
];
