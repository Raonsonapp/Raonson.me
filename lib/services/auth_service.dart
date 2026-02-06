import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api.dart';

class AuthService {
  static String? token;

  static Future<bool> register(String username, String password) async {
    final res = await http.post(
      Uri.parse("$baseUrl/auth/register"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );
    return res.statusCode == 200;
  }

  static Future<bool> login(String username, String password) async {
    final res = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "username": username,
        "password": password,
      }),
    );

    if (res.statusCode == 200) {
      token = jsonDecode(res.body)["access_token"];
      return true;
    }
    return false;
  }
}
