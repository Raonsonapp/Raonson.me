import '../core/api.dart';
import '../core/http_service.dart';

class SearchService {
  static Future<List<dynamic>> explore() async {
    return await HttpService.get('${Api.baseUrl}/search/explore');
  }
}

  // ===== SEARCH POSTS =====
  static Future<List<dynamic>> searchPosts(String query) async {
    if (query.isEmpty) return [];
    final res = await HttpService.get(
      '${Api.baseUrl}/search/posts?q=$query',
    );
    return (res as List?) ?? [];
  }

  // ===== EXPLORE =====
  static Future<List<dynamic>> explore() async {
    final res = await HttpService.get(
      '${Api.baseUrl}/explore',
    );
    return (res as List?) ?? [];
  }
}
