import '../core/session.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String baseUrl = 'https://raonson-me.onrender.com';

  static Future<bool> login(String username, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      await Session.save(username); // ⬅⬅⬅ ИН ХЕЛЕ МУҲИМ
      return true;
    }
    return false;
  }

  static Future<bool> register(String username, String password) async {
    final res = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      await Session.save(username); // ⬅⬅⬅ ИН ХЕЛЕ МУҲИМ
      return true;
    }
    return false;
  }
}
