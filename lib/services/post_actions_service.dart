import '../core/http_service.dart';

class PostActionsService {
  static Future<void> like(int postId) async {
    await HttpService.post(
      '/posts/$postId/like',
      {}, // ✅ ҳатман body
    );
  }

  static Future<void> unlike(int postId) async {
    await HttpService.post(
      '/posts/$postId/unlike',
      {},
    );
  }

  static Future<void> save(int postId) async {
    await HttpService.post(
      '/posts/$postId/save',
      {},
    );
  }

  static Future<void> share(int postId) async {
    await HttpService.post(
      '/posts/$postId/share',
      {},
    );
  }
}
