import 'package:flutter/material.dart';
import '../state/search_state.dart';
import '../services/search_engine.dart';
import 'category_selector.dart';
import 'result_tile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchState state = SearchState();
  final SearchEngine engine = SearchEngine();
  final TextEditingController controller = TextEditingController();

  void runSearch() {
    setState(() {
      state.setResults(engine.search(controller.text, state.selectedCategory));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search')),
      body: Column(
        children: [
          TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: 'Search...'),
            onChanged: (_) => runSearch(),
          ),
          CategorySelector(
            selected: state.selectedCategory,
            onSelect: (c) {
              state.setCategory(c);
              runSearch();
            },
          ),
          Expanded(
            child: ListView(
              children: state.results.map((e) => ResultTile(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
}