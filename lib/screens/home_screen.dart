import 'package:flutter/material.dart';
import '../services/post_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Raonson")),
      body: FutureBuilder<List<dynamic>>(
        future: PostService.getPosts(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return const Center(child: Text("Error loading posts"));
          }

          final posts = snapshot.data!;
          if (posts.isEmpty) {
            return const Center(child: Text("No posts yet"));
          }

          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (context, index) {
              final post = posts[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    post["image"],
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Text(
                      post["caption"] ?? "",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
