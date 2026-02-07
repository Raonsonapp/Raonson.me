import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/session.dart';

class AuthService {
  static const String _baseUrl = 'https://raonson-me.onrender.com';

  // ================= LOGIN =================
  static Future<bool> login(String username, String password) async {
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/login'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      // 🔴 ИН ҶО ХАТО БУД — ҲОЛО ДУРУСТ
      await Session.save(username);
      return true;
    }

    return false;
  }

  // ================= REGISTER =================
  static Future<bool> register(String username, String password) async {
    final res = await http.post(
      Uri.parse('$_baseUrl/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
      }),
    );

    if (res.statusCode == 200) {
      // баъд аз регистрация ҳам логин мекунем
      await Session.save(username);
      return true;
    }

    return false;
  }
}
