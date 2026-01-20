enum FeedItemType { post, reel, video, live }

class FeedItem {
  final String id;
  final String title;
  final String thumbnail;
  final FeedItemType type;
  final int views;

  FeedItem({
    required this.id,
    required this.title,
    required this.thumbnail,
    required this.type,
    required this.views,
  });
}
