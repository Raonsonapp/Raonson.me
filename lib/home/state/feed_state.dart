import '../models/feed_item.dart';

class FeedState {
  final bool loading;
  final List<FeedItem> items;

  FeedState({this.loading = false, this.items = const []});

  FeedState copyWith({bool? loading, List<FeedItem>? items}) {
    return FeedState(
      loading: loading ?? this.loading,
      items: items ?? this.items,
    );
  }
}