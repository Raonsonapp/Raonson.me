import 'dart:io';

class SocketService {
  late WebSocket _ws;
  Future<void> connect(String u) async {
    _ws = await WebSocket.connect(
      'wss://raonson-me.onrender.com/ws/chat/$u',
    );
  }
  Stream<String> stream() => _ws.cast<String>();
  void send(String to, String msg) => _ws.add('$to:$msg');
  void close() => _ws.close();
}
