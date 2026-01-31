import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(Icons.play_circle_fill,
                      color: Colors.white, size: 80),
                ),
              ),

              // Actions Right
              Positioned(
                right: 16,
                bottom: 100,
                child: Column(
                  children: const [
                    Icon(Icons.favorite, color: Colors.white, size: 32),
                    SizedBox(height: 20),
                    Icon(Icons.comment, color: Colors.white, size: 32),
                    SizedBox(height: 20),
                    Icon(Icons.share, color: Colors.white, size: 32),
                  ],
                ),
              ),

              // User + Caption
              Positioned(
                left: 16,
                bottom: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('@raonson_user',
                        style: TextStyle(color: Colors.white)),
                    SizedBox(height: 4),
                    Text('Amazing Video 🔥',
                        style: TextStyle(color: Colors.white70)),
                  ],
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
