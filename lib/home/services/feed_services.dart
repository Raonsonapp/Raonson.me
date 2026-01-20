import '../models/feed_item.dart';

class FeedService {
  Future<List<FeedItem>> load(int page) async {
    await Future.delayed(const Duration(milliseconds: 400));

    return List.generate(
      20,
      (i) => FeedItem(
        id: 'p${page}_$i',
        title: 'Post $i',
        thumbnail: 'https://placehold.co/400x600',
        type: FeedItemType.video,
        views: 1000 * (i + 1),
      ),
    );
  }
}
