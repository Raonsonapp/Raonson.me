import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'api.dart';

class HttpService {
  static const Duration _timeout = Duration(seconds: 15);

  static Future<dynamic> get(String path) async {
    try {
      final res = await http
          .get(Uri.parse('${Api.baseUrl}$path'))
          .timeout(_timeout);

      return _handleResponse(res);
    } on TimeoutException {
      throw Exception('Request timeout');
    }
  }

  static Future<dynamic> post(
    String path,
    Map<String, dynamic> body,
  ) async {
    try {
      final res = await http
          .post(
            Uri.parse('${Api.baseUrl}$path'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode(body),
          )
          .timeout(_timeout);

      return _handleResponse(res);
    } on TimeoutException {
      throw Exception('Request timeout');
    }
  }

  static dynamic _handleResponse(http.Response res) {
    if (res.statusCode >= 200 && res.statusCode < 300) {
      if (res.body.isEmpty) return null;
      return jsonDecode(res.body);
    } else {
      throw Exception('HTTP ${res.statusCode}: ${res.body}');
    }
  }
}
