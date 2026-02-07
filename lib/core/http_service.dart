import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const base = 'https://raonson-me.onrender.com';

  static Future<http.Response> post(String path, Map body) {
    return http.post(
      Uri.parse(base + path),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> get(String path) {
    return http.get(Uri.parse(base + path));
  }
}
