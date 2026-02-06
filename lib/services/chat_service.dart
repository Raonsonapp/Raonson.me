import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api.dart';

class ChatService {
  static Future<List<dynamic>> getChats(int userId) async {
    final response = await http.get(
      Uri.parse("${Api.baseUrl}/chats/$userId"),
      headers: {"Accept": "application/json"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Failed to load chats");
    }
  }
}
