import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';
import 'session.dart';

class HttpService {
  static Future<http.Response> get(String path) async {
    final token = await Session.getToken();

    return await http.get(
      Uri.parse(Api.baseUrl + path),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );
  }

  static Future<http.Response> post(
    String path, {
    Map<String, dynamic>? body,
  }) async {
    final token = await Session.getToken();

    return await http.post(
      Uri.parse(Api.baseUrl + path),
      headers: {
        'Content-Type': 'application/json',
        if (token != null) 'Authorization': 'Bearer $token',
      },
      body: jsonEncode(body ?? {}),
    );
  }
}
