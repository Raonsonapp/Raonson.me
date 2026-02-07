import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  static const Duration _timeout = Duration(seconds: 15);

  // ===== GET =====
  static Future<dynamic> get(String url) async {
    try {
      final res = await http.get(
        Uri.parse(url),
        headers: _headers(),
      ).timeout(_timeout);

      return _handleResponse(res);
    } on SocketException {
      throw Exception('No internet connection');
    } on TimeoutException {
      throw Exception('Request timeout');
    }
  }

  // ===== POST =====
  static Future<dynamic> post(String url, Map<String, dynamic> body) async {
    try {
      final res = await http.post(
        Uri.parse(url),
        headers: _headers(),
        body: jsonEncode(body),
      ).timeout(_timeout);

      return _handleResponse(res);
    } on SocketException {
      throw Exception('No internet connection');
    } on TimeoutException {
      throw Exception('Request timeout');
    }
  }

  // ===== HEADERS =====
  static Map<String, String> _headers() {
    return {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  // ===== RESPONSE HANDLER =====
  static dynamic _handleResponse(http.Response res) {
    final status = res.statusCode;

    if (res.body.isEmpty) return null;

    final data = jsonDecode(res.body);

    if (status >= 200 && status < 300) {
      return data;
    } else {
      // сервер хатогиро худ менависад
      throw Exception(data.toString());
    }
  }
}
