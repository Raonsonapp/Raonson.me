import 'package:flutter/material.dart';
import '../../services/search_service.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0F1A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B0F1A),
        title: const Text('Search'),
      ),
      body: FutureBuilder<List>(
        future: SearchService.searchPosts(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snap.hasError) {
            return const Center(child: Text('Search failed'));
          }

          final posts = snap.data!;
          return GridView.builder(
            padding: const EdgeInsets.all(2),
            itemCount: posts.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 2,
              mainAxisSpacing: 2,
            ),
            itemBuilder: (context, i) {
              return Container(
                color: Colors.white10,
                child: const Icon(Icons.image, color: Colors.white24),
              );
            },
          );
        },
      ),
    );
  }
}
