import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config.dart';
import 'auth_service.dart';

class UserService {
  static Map<String, String> _headers() => {
        'Content-Type': 'application/json',
        if (AuthService.token != null)
          'Authorization': 'Bearer ${AuthService.token}',
      };

  static Future<Map<String, dynamic>> getProfile() async {
    final res = await http
        .get(
          Uri.parse('${AppConfig.baseUrl}/profile'),
          headers: _headers(),
        )
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('Profile load failed');
  }

  static Future<List> getUserPosts() async {
    final res = await http
        .get(
          Uri.parse('${AppConfig.baseUrl}/profile/posts'),
          headers: _headers(),
        )
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('Posts load failed');
  }
}
