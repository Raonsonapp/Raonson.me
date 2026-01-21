import 'package:flutter/material.dart';
import '../core/feed_post.dart';
import '../services/feed_service.dart';

class FeedController extends ChangeNotifier {
  final FeedService _service = FeedService();

  List<FeedPost> posts = [];
  bool loading = true;

  Future<void> load() async {
    loading = true;
    notifyListeners();

    posts = await _service.loadFeed();
    loading = false;
    notifyListeners();
  }

  void toggleLike(String postId) {
    final index = posts.indexWhere((p) => p.id == postId);
    if (index == -1) return;

    final post = posts[index];
    posts[index] = post.copyWith(
      liked: !post.liked,
      likes: post.liked ? post.likes - 1 : post.likes + 1,
    );
    notifyListeners();
  }
}
