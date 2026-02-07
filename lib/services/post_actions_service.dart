import '../core/api.dart';
import '../core/http_service.dart';

class PostActionsService {
  static Future<void> like(String postId, String user) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/like',
      body: {'user': user},
    );
  }

  static Future<void> unlike(String postId, String user) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/unlike',
      body: {'user': user},
    );
  }

  static Future<void> save(String postId, String user) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/save',
      body: {'user': user},
    );
  }

  static Future<void> unsave(String postId, String user) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/unsave',
      body: {'user': user},
    );
  }

  static Future<List<dynamic>> comments(String postId) async {
    return await HttpService.get(
      '${Api.baseUrl}/posts/$postId/comments',
    );
  }

  static Future<void> addComment(
      String postId, String user, String text) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/comments',
      body: {
        'user': user,
        'text': text,
      },
    );
  }
}
