import 'feed_type.dart';

class FeedItem {
  final String id;
  final String author;
  final FeedType type;
  final String contentUrl;
  final String caption;
  int likes;

  FeedItem({
    required this.id,
    required this.author,
    required this.type,
    required this.contentUrl,
    required this.caption,
    this.likes = 0,
  });
}
