import 'package:flutter/material.dart';
import '../models/search_item.dart';

class SearchResultTile extends StatelessWidget {
  final SearchItem item;

  const SearchResultTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.category.name),
      leading: const Icon(Icons.play_circle),
    );
  }
}