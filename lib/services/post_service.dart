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
}
