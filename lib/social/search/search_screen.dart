import 'package:flutter/material.dart';
import 'search_controller.dart';
import '../feed/feed_category.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchController controller = SearchController();
  final TextEditingController input = TextEditingController();
  FeedCategory selected = FeedCategory.all;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: TextField(
              controller: input,
              decoration: const InputDecoration(
                hintText: "Search videos, anime, music...",
              ),
              onSubmitted: (_) async {
                setState(() {});
                await controller.execute(input.text, selected);
                setState(() {});
              },
            ),
          ),
          SizedBox(
            height: 40,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: FeedCategory.values.map((c) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: ChoiceChip(
                    label: Text(c.label),
                    selected: selected == c,
                    onSelected: (_) => setState(() => selected = c),
                  ),
                );
              }).toList(),
            ),
          ),
          Expanded(
            child: controller.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: controller.results.length,
                    itemBuilder: (_, i) {
                      final r = controller.results[i];
                      return ListTile(
                        leading: const Icon(Icons.search),
                        title: Text(r.title),
                        subtitle: Text(r.category.label),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}