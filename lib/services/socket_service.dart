import 'dart:io';

class SocketService {
  late WebSocket _socket;

  Future<void> connect(String username) async {
    _socket = await WebSocket.connect(
      'wss://raonson-me.onrender.com/ws/chat/$username',
    );
  }

  Stream<String> messages() => _socket.asBroadcastStream().cast<String>();

  void send(String to, String message) {
    _socket.add('$to:$message');
  }

  void dispose() {
    _socket.close();
  }
}
