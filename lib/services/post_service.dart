import '../core/api.dart';
import '../core/http_service.dart';

class PostService {
  // ===== GET ALL POSTS =====
  static Future<List<dynamic>> getAll() async {
    final res = await HttpService.get(Api.posts);
    return (res as List?) ?? [];
  }

  // ===== CREATE POST =====
  static Future<void> create({
    required String username,
    required String imageUrl,
    required String caption,
  }) async {
    await HttpService.post(
      Api.posts,
      {
        'username': username,
        'image_url': imageUrl,
        'caption': caption,
      },
    );
  }

  // ===== LIKE POST =====
  static Future<void> like(int postId) async {
    await HttpService.post(Api.likePost(postId), {});
  }

  // ===== GET COMMENTS =====
  static Future<List<dynamic>> comments(int postId) async {
    final res = await HttpService.get(Api.comments(postId));
    return (res as List?) ?? [];
  }

  // ===== ADD COMMENT =====
  static Future<void> addComment({
    required int postId,
    required String username,
    required String text,
  }) async {
    await HttpService.post(
      Api.comments(postId),
      {
        'username': username,
        'text': text,
      },
    );
  }
}
