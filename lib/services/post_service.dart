import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config.dart';
import 'auth_service.dart';

class PostService {
  static Map<String, String> _headers() => {
        'Content-Type': 'application/json',
        if (AuthService.token != null)
          'Authorization': 'Bearer ${AuthService.token}',
      };

  static Future<List<dynamic>> getFeed() async {
    final res = await http
        .get(
          Uri.parse('${AppConfig.baseUrl}/posts'),
          headers: _headers(),
        )
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    } else {
      throw Exception('Failed to load feed');
    }
  }
}
