import '../core/api.dart';
import '../core/http_service.dart';

class ChatService {
  // ===== GET CHATS =====
  static Future<List<dynamic>> getChats(String username) async {
    final res = await HttpService.get(
      '${Api.baseUrl}/chats/$username',
    );
    return (res as List?) ?? [];
  }

  // ===== GET MESSAGES =====
  static Future<List<dynamic>> getMessages(String chatId) async {
    final res = await HttpService.get(
      '${Api.baseUrl}/chats/$chatId/messages',
    );
    return (res as List?) ?? [];
  }

  // ===== SEND MESSAGE =====
  static Future<void> sendMessage({
    required String chatId,
    required String from,
    required String text,
  }) async {
    await HttpService.post(
      '${Api.baseUrl}/chats/$chatId/messages',
      {
        'from': from,
        'text': text,
      },
    );
  }
}
