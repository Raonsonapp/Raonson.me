import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config.dart';

class AuthService {
  static String? token;

  static Future<bool> login(String u, String p) async {
    final res = await http
        .post(
          Uri.parse('${AppConfig.baseUrl}/auth/login'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'username': u, 'password': p}),
        )
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      token = jsonDecode(res.body)['access_token'];
      return true;
    }
    return false;
  }

  static Future<bool> register(String u, String p) async {
    final res = await http
        .post(
          Uri.parse('${AppConfig.baseUrl}/auth/register'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'username': u, 'password': p}),
        )
        .timeout(const Duration(seconds: 10));
    return res.statusCode == 200;
  }
}
