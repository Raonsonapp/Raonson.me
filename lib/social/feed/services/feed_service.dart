import '../core/feed_post.dart';

class FeedService {
  Future<List<FeedPost>> loadFeed() async {
    await Future.delayed(const Duration(milliseconds: 400));

    return List.generate(
      10,
      (i) => FeedPost(
        id: 'post_$i',
        userId: 'user_$i',
        username: 'user_$i',
        content: 'This is post number $i',
        likes: i * 3,
        comments: i,
      ),
    );
  }
}
