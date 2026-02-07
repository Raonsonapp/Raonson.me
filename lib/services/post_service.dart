import 'dart:convert';
import '../core/api.dart';
import '../core/http_service.dart';
import '../models/post.dart';

class PostService {
  static Future<List<Post>> fetchPosts() async {
    final res = await HttpService.get(Api.posts);
    final List data = jsonDecode(res.body);
    return data.map((e) => Post.fromJson(e)).toList();
  }

  static Future<void> createPost({
    required String imageUrl,
    required String caption,
  }) async {
    await HttpService.post(
      Api.posts,
      body: {
        'image_url': imageUrl,
        'caption': caption,
      },
    );
  }
}
