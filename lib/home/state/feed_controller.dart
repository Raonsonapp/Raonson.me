import 'package:flutter/material.dart';
import '../services/feed_service.dart';
import 'feed_state.dart';

class FeedController extends ChangeNotifier {
  final FeedService _service = FeedService();
  FeedState state = FeedState();
  int _page = 0;

  Future<void> loadMore() async {
    if (state.loading) return;

    state = state.copyWith(loading: true);
    notifyListeners();

    final data = await _service.load(_page++);
    state = FeedState(items: [...state.items, ...data]);
    notifyListeners();
  }
}
