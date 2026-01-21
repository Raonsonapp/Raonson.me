import '../models/live_message.dart';

class LiveChatService {
  final List<LiveMessage> _messages = [];

  void send(String userId, String text) {
    _messages.add(
      LiveMessage(
        userId: userId,
        text: text,
        time: DateTime.now(),
      ),
    );
  }

  List<LiveMessage> get messages => _messages;
}