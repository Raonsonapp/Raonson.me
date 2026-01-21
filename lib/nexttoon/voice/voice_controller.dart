import 'voice_track.dart';
import 'dubbing_engine.dart';

class VoiceController {
  final DubbingEngine engine = DubbingEngine();

  Future<void> process(VoiceTrack track) async {
    await engine.dub(track);
  }
}