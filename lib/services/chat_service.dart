import 'dart:convert';
import '../core/api.dart';
import '../core/http_service.dart';
import '../models/message.dart';

class ChatService {
  static Future<List<String>> chats() async {
    final res = await HttpService.get(Api.chats);
    final List data = jsonDecode(res.body);
    return data.map((e) => e.toString()).toList();
  }

  static Future<List<Message>> messages(String user) async {
    final res = await HttpService.get('${Api.messages}/$user');
    final List data = jsonDecode(res.body);
    return data.map((e) => Message.fromJson(e)).toList();
  }

  static Future<void> send({
    required String to,
    required String text,
  }) async {
    await HttpService.post(
      Api.sendMessage,
      body: {
        'to': to,
        'text': text,
      },
    );
  }
}
