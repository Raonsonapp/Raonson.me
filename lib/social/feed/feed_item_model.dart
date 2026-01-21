import 'feed_category.dart';

class FeedItem {
  final String id;
  final String title;
  final String mediaUrl;
  final FeedCategory category;
  final DateTime createdAt;

  FeedItem({
    required this.id,
    required this.title,
    required this.mediaUrl,
    required this.category,
    required this.createdAt,
  });
}