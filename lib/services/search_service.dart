import '../core/api.dart';
import '../core/http_service.dart';

class SearchService {
  // ===== SEARCH USERS =====
  static Future<List<dynamic>> searchUsers(String query) async {
    if (query.isEmpty) return [];
    final res = await HttpService.get(
      '${Api.baseUrl}/search/users?q=$query',
    );
    return (res as List?) ?? [];
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
