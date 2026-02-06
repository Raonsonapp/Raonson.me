import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api.dart';
import 'auth_service.dart';

class ChatService {
  static Map<String, String> _headers() => {
        "Content-Type": "application/json",
        "Authorization": AuthService.token ?? "",
      };

  // GET conversations
  static Future<List> getConversations() async {
    final res = await http.get(
      Uri.parse("$baseUrl/chat/conversations"),
      headers: _headers(),
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to load conversations");
    }
    return jsonDecode(res.body);
  }

  // GET messages
  static Future<List> getMessages(String conversationId) async {
    final res = await http.get(
      Uri.parse("$baseUrl/chat/$conversationId/messages"),
      headers: _headers(),
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to load messages");
    }
    return jsonDecode(res.body);
  }

  // SEND message
  static Future<void> sendMessage(String toUserId, String text) async {
    final res = await http.post(
      Uri.parse("$baseUrl/chat/send"),
      headers: _headers(),
      body: jsonEncode({
        "to_user_id": toUserId,
        "text": text,
      }),
    );

    if (res.statusCode != 200) {
      throw Exception("Failed to send message");
    }
  }
}
