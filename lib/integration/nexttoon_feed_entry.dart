import 'package:flutter/material.dart';
import 'nexttoon_to_feed_mapper.dart';

class NextToonFeedEntry extends StatelessWidget {
  final FeedItemModel item;

  const NextToonFeedEntry({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetricsymmetric(vertical: 8, horizontal: 12),
      child: ListTile(
        leading: const Icon(Icons.movie),
        title: Text(item.title),
        subtitle: Text(item.createdAt.toString()),
      ),
    );
  }
}
