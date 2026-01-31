import 'package:flutter/material.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [

              /// Fake Video Background
              Container(
                color: Colors.black,
                child: const Center(
                  child: Icon(Icons.play_circle, color: Colors.white, size: 100),
                ),
              ),

              /// Right Actions
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

              /// Username + Caption
              const Positioned(
                left: 16,
                bottom: 40,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("@raonson_user",
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(height: 6),
                    Text("Amazing video 🔥",
                        style: TextStyle(color: Colors.white)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
