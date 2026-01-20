import '../models/feed_item.dart';
import '../models/feed_type.dart';

class FeedService {
  Future<List<FeedItem>> loadFeed() async {
    // API real later
    return [
      FeedItem(
        id: '1',
        author: 'raonson',
        type: FeedType.video,
        contentUrl: 'video.mp4',
        caption: 'First reel',
      ),
      FeedItem(
        id: '2',
        author: 'raonson',
        type: FeedType.image,
        contentUrl: 'image.jpg',
        caption: 'First post',
      ),
    ];
  }
}
