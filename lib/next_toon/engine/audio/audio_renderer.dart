import 'dub_request.dart';

class AudioRenderer {
  Future<String> renderVoice(DubRequest request) async {
    // Fake render delay (AI / Studio)
    await Future.delayed(const Duration(milliseconds: 500));

    return '/audio/${request.actor.id}_${request.line.start.inMilliseconds}.wav';
  }
}
