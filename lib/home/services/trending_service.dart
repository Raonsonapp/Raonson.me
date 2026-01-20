import '../models/feed_item.dart';

class TrendingService {
  List<FeedItem> trending() {
    return List.generate(
      8,
      (i) => FeedItem(
        id: 'trend_$i',
        title: 'Trending $i',
        thumbnail: 'https://placehold.co/300x400',
        type: FeedItemType.reel,
        views: 50000,
      ),
    );
  }
}