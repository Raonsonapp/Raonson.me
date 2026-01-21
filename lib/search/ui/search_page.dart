import 'package:flutter/material.dart';
import '../state/search_controller.dart';
import 'category_bar.dart';
import 'search_result_tile.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final SearchController controller = SearchController();
  final TextEditingController text = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final state = controller.state;

    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: text,
          decoration: const InputDecoration(
            hintText: 'Search...',
            border: InputBorder.none,
          ),
          onSubmitted: (q) async {
            await controller.search(q);
            setState(() {});
          },
        ),
      ),
      body: Column(
        children: [
          CategoryBar(
            selected: state.category,
            onChanged: (c) {
              setState(() {
                controller.changeCategory(c);
              });
            },
          ),
          Expanded(
            child: state.loading
                ? const Center(child: CircularProgressIndicator())
                : ListView(
                    children: state.results
                        .map((e) => SearchResultTile(item: e))
                        .toList(),
                  ),
          )
        ],
      ),
    );
  }
}