import 'feed_repository.dart';
import 'feed_item_model.dart';
import 'feed_category.dart';

class FeedController {
  final FeedRepository _repo = FeedRepository();

  FeedCategory currentCategory = FeedCategory.all;
  List<FeedItem> items = [];

  Future<void> load() async {
    items = await _repo.loadFeed(currentCategory);
  }

  Future<void> changeCategory(FeedCategory category) async {
    currentCategory = category;
    await load();
  }
}