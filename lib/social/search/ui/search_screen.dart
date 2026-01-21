import 'package:flutter/material.dart';
import '../state/search_controller.dart';
import '../core/search_category.dart';
import 'widgets/category_tabs.dart';
import 'widgets/search_result_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final controller = SearchController();
  final textCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: textCtrl,
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
              ),
              onSubmitted: controller.search,
            ),
          ),
          CategoryTabs(
            selected: controller.category,
            onSelected: controller.setCategory,
          ),
          Expanded(
            child: AnimatedBuilder(
              animation: controller,
              builder: (_, __) {
                if (controller.loading) {
                  return const Center(child: CircularProgressIndicator());
                }
                return ListView(
                  children: controller.results
                      .map((p) => SearchResultCard(post: p))
                      .toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}