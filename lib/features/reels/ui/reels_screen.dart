import 'package:flutter/material.dart';

class ReelsScreen extends StatefulWidget {
  const ReelsScreen({super.key});

  @override
  State<ReelsScreen> createState() => _ReelsScreenState();
}

class _ReelsScreenState extends State<ReelsScreen> {
  bool liked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: Colors.black,
            width: double.infinity,
            height: double.infinity,
            child: const Center(
              child: Icon(Icons.play_circle_fill,
                  color: Colors.white, size: 100),
            ),
          ),

          /// Right buttons
          Positioned(
            right: 12,
            bottom: 120,
            child: Column(
              children: [
                IconButton(
                  icon: Icon(
                    liked ? Icons.favorite : Icons.favorite_border,
                    color: liked ? Colors.red : Colors.white,
                    size: 32,
                  ),
                  onPressed: () {
                    setState(() {
                      liked = !liked;
                    });
                  },
                ),
                const SizedBox(height: 20),
                const Icon(Icons.comment, color: Colors.white, size: 30),
                const SizedBox(height: 20),
                const Icon(Icons.share, color: Colors.white, size: 30),
              ],
            ),
          ),

          /// Bottom text
          const Positioned(
            left: 12,
            bottom: 40,
            child: Text(
              "@raonson_user\nAmazing Reel 🔥",
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
