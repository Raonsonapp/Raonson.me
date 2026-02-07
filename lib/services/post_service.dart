import 'dart:convert';
import '../core/http_service.dart';
import '../models/post_model.dart';

class PostService {
  static Future<List<PostModel>> fetchPosts() async {
    final res = await HttpService.get('/posts');

    if (res.statusCode == 200) {
      final List data = jsonDecode(res.body);
      return data.map((e) => PostModel.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  static Future<void> likePost(int postId) async {
    await HttpService.post('/posts/$postId/like', {});
  }
}
