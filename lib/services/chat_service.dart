import 'dart:convert';
import 'package:http/http.dart' as http;
import '../config/api.dart';
import 'auth_service.dart';

class ChatService {
  static Future<List> getConversations() async {
    final res = await http.get(
      Uri.parse("$baseUrl/chat/conversations"),
      headers: {"Authorization": AuthService.token!},
    );
    return jsonDecode(res.body);
  }
}
