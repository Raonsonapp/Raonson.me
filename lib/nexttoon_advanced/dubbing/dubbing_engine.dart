import 'dub_request.dart';

class DubbingEngine {
  Future<String> generateDub(DubRequest request) async {
    // Симуляция pipeline (дар версияи сервер ба AI меравaд)
    await Future.delayed(const Duration(seconds: 2));

    return "dubbed_audio_${request.episodeId}.wav";
  }
}