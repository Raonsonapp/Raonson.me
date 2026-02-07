import 'dart:convert';
import '../core/http_service.dart';
import '../core/session.dart';

class PostService {
  static Future<List> getPosts() async {
    final r = await HttpService.get('/posts');
    return jsonDecode(r.body);
  }

  static Future<void> create(String caption) async {
    final u = await Session.username();
    await HttpService.post('/posts', {
      'username': u,
      'caption': caption,
    });
  }

  static Future<void> like(int id) async {
    await HttpService.post('/posts/$id/like', {});
  }
}
