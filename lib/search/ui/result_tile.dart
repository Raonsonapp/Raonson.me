import 'package:flutter/material.dart';
import '../models/search_item.dart';

class ResultTile extends StatelessWidget {
  final SearchItem item;
  const ResultTile(this.item, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(item.title),
      subtitle: Text(item.category.name),
      trailing: Text('${item.views} views'),
    );
  }
}