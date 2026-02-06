import 'package:flutter/material.dart';
import '../../services/search_service.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String q = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: const InputDecoration(hintText: "Search"),
          onChanged: (v) => setState(() => q = v),
        ),
      ),
      body: q.isEmpty
          ? const Center(child: Text("Type to search"))
          : FutureBuilder<Map<String, dynamic>>(
              future: SearchService.search(q),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return const Center(child: CircularProgressIndicator());
                }
                final posts = snap.data!["posts"];
                return GridView.builder(
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                  itemCount: posts.length,
                  itemBuilder: (_, i) =>
                      Image.network(posts[i]["image_url"], fit: BoxFit.cover),
                );
              },
            ),
    );
  }
}
