import '../models/live_message.dart';
import '../models/live_room.dart';

class LiveState {
  LiveRoom? room;
  bool isLive = false;
  final List<LiveMessage> messages = [];

  void start(LiveRoom r) {
    room = r;
    isLive = true;
  }

  void stop() {
    isLive = false;
    room?.status = LiveStatus.ended;
  }

  void addMessage(LiveMessage msg) {
    messages.add(msg);
  }
}
