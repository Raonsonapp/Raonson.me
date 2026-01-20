import '../models/feed_item.dart';

class FeedState {
  final List<FeedItem> items;
  final bool loading;

  FeedState({
    this.items = const [],
    this.loading = false,
  });
}