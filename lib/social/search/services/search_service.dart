import '../../feed/core/feed_post.dart';
import '../core/search_category.dart';

class SearchService {
  Future<List<FeedPost>> search({
    required String query,
    required SearchCategory category,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    return List.generate(
      8,
      (i) => FeedPost(
        id: 'search_${category.name}_$i',
        userId: 'user_$i',
        username: '${category.label}_creator',
        content: 'Result "$query" in ${category.label}',
        likes: i * 5,
        comments: i,
      ),
    );
  }
}
