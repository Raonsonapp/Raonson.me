import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/session.dart';

class AuthService {
  static const String baseUrl = 'https://raonson-me.onrender.com';

  /// REGISTER
  static Future<bool> register(String username, String password) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/register'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      print('REGISTER STATUS: ${res.statusCode}');
      print('REGISTER BODY: ${res.body}');

      if (res.statusCode == 200 || res.statusCode == 201) {
        await Session.save(username);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('REGISTER ERROR: $e');
      return false;
    }
  }

  /// LOGIN
  static Future<bool> login(String username, String password) async {
    try {
      final res = await http.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
        body: jsonEncode({
          'username': username,
          'password': password,
        }),
      );

      print('LOGIN STATUS: ${res.statusCode}');
      print('LOGIN BODY: ${res.body}');

      if (res.statusCode == 200) {
        await Session.save(username);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('LOGIN ERROR: $e');
      return false;
    }
  }
}
