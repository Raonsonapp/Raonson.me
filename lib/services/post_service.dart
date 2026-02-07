import '../core/http_service.dart';
import '../core/api.dart';

class PostService {
  static Future<List<dynamic>> getAll() async {
    return await HttpService.get('${Api.baseUrl}/posts');
  }

  static Future<List<dynamic>> getReels() async {
    return await HttpService.get('${Api.baseUrl}/reels');
  }

  static Future<List<dynamic>> getByUser(String username) async {
    return await HttpService.get(
      '${Api.baseUrl}/users/$username/posts',
    );
  }

  static Future<void> create({
    required String username,
    required String caption,
    String? imageUrl,
  }) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/create',
      {
        'username': username,
        'caption': caption,
        'image_url': imageUrl ?? '',
      },
    );
  }

  static Future<List<dynamic>> comments(int postId) async {
    return await HttpService.get(
      '${Api.baseUrl}/posts/$postId/comments',
    );
  }

  static Future<void> addComment({
    required int postId,
    required String username,
    required String text,
  }) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/comment',
      {
        'username': username,
        'text': text,
      },
    );
  }
}
