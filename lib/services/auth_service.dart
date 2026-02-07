import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/session.dart';

class AuthService {
  static const String baseUrl = 'https://raonson-me.onrender.com';

  static Future<bool> register(String username, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    print('REGISTER STATUS: ${res.statusCode}');
    print('REGISTER BODY: ${res.body}');

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);

      if (data['message'] != null) {
        await Session.save(username);
        return true;
      }
    }
    return false;
  }

  static Future<bool> login(String username, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    print('LOGIN STATUS: ${res.statusCode}');
    print('LOGIN BODY: ${res.body}');

    if (res.statusCode == 200) {
      final data = jsonDecode(res.body);

      if (data['message'] != null || data['token'] != null) {
        await Session.save(username);
        return true;
      }
    }
    return false;
  }
}
