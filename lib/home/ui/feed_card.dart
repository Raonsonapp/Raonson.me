import 'package:flutter/material.dart';
import '../models/feed_item.dart';

class FeedCard extends StatelessWidget {
  final FeedItem item;
  const FeedCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Image.network(item.thumbnail),
          ListTile(
            title: Text(item.title),
            subtitle: Text('${item.views} views'),
          ),
        ],
      ),
    );
  }
}
