import 'package:flutter/material.dart';
import '../../services/post_service.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Raonson")),
      body: FutureBuilder<List>(
        future: PostService.getFeed(),
        builder: (context, snap) {
          if (!snap.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final posts = snap.data!;
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, i) {
              final p = posts[i];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(p["image_url"]),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(p["caption"] ?? ""),
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
