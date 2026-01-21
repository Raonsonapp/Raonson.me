import '../models/live_room.dart';
import '../state/live_state.dart';

class LiveEngine {
  LiveEngine._();
  static final instance = LiveEngine._();

  final LiveState state = LiveState();

  LiveRoom createRoom(String hostId) {
    final room = LiveRoom(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      hostId: hostId,
      startedAt: DateTime.now(),
    );
    state.start(room);
    return room;
  }

  void endLive() {
    state.stop();
  }
}