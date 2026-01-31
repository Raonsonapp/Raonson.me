import 'package:flutter/material.dart';
import '../data/post_model.dart';

class FeedController extends ChangeNotifier {
  List<Post> posts = [
    Post(
      id: "1",
      user: "Raonson",
      imageUrl: "https://picsum.photos/400",
      likes: 10,
    ),
  ];

  void toggleLike(Post post) {
    post.liked = !post.liked;
    post.likes += post.liked ? 1 : -1;
    notifyListeners();
  }
}
