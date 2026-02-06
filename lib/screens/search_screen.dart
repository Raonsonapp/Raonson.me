import 'package:flutter/material.dart';
import '../services/search_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(
            hintText: "Search",
            border: InputBorder.none,
          ),
          onChanged: (value) {
            setState(() => query = value);
          },
        ),
      ),
      body: query.isEmpty
          ? const Center(child: Text("Search posts or users"))
          : FutureBuilder<Map<String, dynamic>>(
              future: SearchService.search(query),
              builder: (context, snapshot) {
                if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(
                      child: CircularProgressIndicator());
                }

                if (snapshot.hasError) {
                  return const Center(
                      child: Text("Search error"));
                }

                final data = snapshot.data!;
                final posts = data["posts"] as List;

                if (posts.isEmpty) {
                  return const Center(child: Text("No results"));
                }

                return GridView.builder(
                  padding: const EdgeInsets.all(4),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                  ),
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    final post = posts[index];
                    return Image.network(
                      post["image"],
                      fit: BoxFit.cover,
                    );
                  },
                );
              },
            ),
    );
  }
}
