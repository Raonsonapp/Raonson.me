import '../core/http_service.dart';
import '../core/api.dart';

class PostActionsService {
  static Future<void> like(int postId, String username) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/like',
      {'username': username},
    );
  }

  static Future<void> unlike(int postId, String username) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/unlike',
      {'username': username},
    );
  }

  static Future<void> save(int postId, String username) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/save',
      {'username': username},
    );
  }

  static Future<void> unsave(int postId, String username) async {
    await HttpService.post(
      '${Api.baseUrl}/posts/$postId/unsave',
      {'username': username},
    );
  }

  static Future<List<dynamic>> getSaved(String username) async {
    return await HttpService.get(
      '${Api.baseUrl}/users/$username/saved',
    );
  }
}
