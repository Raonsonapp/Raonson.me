import 'dart:convert';
import 'package:http/http.dart' as http;
import '../core/config.dart';
import 'auth_service.dart';

class ChatService {
  static Map<String, String> _headers() => {
        'Content-Type': 'application/json',
        if (AuthService.token != null)
          'Authorization': 'Bearer ${AuthService.token}',
      };

  static Future<List> getChats() async {
    final res = await http
        .get(
          Uri.parse('${AppConfig.baseUrl}/chat'),
          headers: _headers(),
        )
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('Chat load error');
  }

  static Future<List> getMessages(String chatId) async {
    final res = await http
        .get(
          Uri.parse('${AppConfig.baseUrl}/chat/$chatId'),
          headers: _headers(),
        )
        .timeout(const Duration(seconds: 10));

    if (res.statusCode == 200) {
      return jsonDecode(res.body);
    }
    throw Exception('Messages error');
  }

  static Future<void> sendMessage(String chatId, String text) async {
    await http.post(
      Uri.parse('${AppConfig.baseUrl}/chat/$chatId/send'),
      headers: _headers(),
      body: jsonEncode({'text': text}),
    );
  }
}
