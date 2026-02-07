import 'package:flutter/material.dart';
import '../../services/post_service.dart';
import '../../models/post_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<PostModel> posts = [];

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final data = await PostService.fetchPosts();
    setState(() => posts = data);
  }

  @override
  Widget build(BuildContext context) {
    // UI ҳамон мемонад
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        elevation: 0,
        title: const Text(
          'Raonson',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        actions: const [
          Icon(Icons.notifications_none, color: Colors.white),
          SizedBox(width: 12),
        ],
      ),
      body: ListView(
        children: [
          _stories(),
          const SizedBox(height: 12),
          _postCard(),
          _postCard(),
        ],
      ),
    );
  }

  // ================= STORIES =================
  Widget _stories() {
    return SizedBox(
      height: 96,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 12),
        itemCount: 8,
        itemBuilder: (c, i) {
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Colors.blueAccent, Colors.lightBlue],
                    ),
                  ),
                  child: const CircleAvatar(
                    radius: 28,
                    backgroundColor: Color(0xFF0B0F1A),
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'user',
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  // ================= POST CARD =================
  Widget _postCard() {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 8, 12, 16),
      decoration: BoxDecoration(
        color: const Color(0xFF11162A),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.blueAccent.withOpacity(0.18),
            blurRadius: 22,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: const [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.person, color: Colors.white, size: 18),
                ),
                SizedBox(width: 10),
                Text(
                  'username',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Icon(Icons.more_vert, color: Colors.white54),
              ],
            ),
          ),

          // IMAGE
          Container(
            height: 240,
            color: Colors.black,
            child: const Center(
              child: Icon(Icons.image, size: 80, color: Colors.white24),
            ),
          ),

          // ACTIONS
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 10, 12, 6),
            child: Row(
              children: const [
                Icon(Icons.favorite_border, color: Colors.white),
                SizedBox(width: 18),
                Icon(Icons.chat_bubble_outline, color: Colors.white),
                SizedBox(width: 18),
                Icon(Icons.send, color: Colors.white),
                Spacer(),
                Icon(Icons.bookmark_border, color: Colors.white),
              ],
            ),
          ),

          // CAPTION
          const Padding(
            padding: EdgeInsets.fromLTRB(12, 0, 12, 12),
            child: Text(
              'This is a caption example for Raonson post.',
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ],
      ),
    );
  }
}
