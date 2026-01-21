import 'feed_item_model.dart';
import 'feed_category.dart';

class FeedRepository {
  Future<List<FeedItem>> loadFeed(FeedCategory category) async {
    await Future.delayed(const Duration(milliseconds: 600));

    return List.generate(10, (i) {
      return FeedItem(
        id: "$category-$i",
        title: "${category.label} Video $i",
        mediaUrl: "local://video_$i.mp4",
        category: category,
        createdAt: DateTime.now().subtract(Duration(minutes: i * 5)),
      );
    });
  }
}