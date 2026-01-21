import 'audio_renderer.dart';
import 'dub_request.dart';

class DubPipeline {
  final AudioRenderer renderer = AudioRenderer();

  Future<List<String>> process(List<DubRequest> requests) async {
    final audioFiles = <String>[];

    for (final request in requests) {
      final audioPath = await renderer.renderVoice(request);
      audioFiles.add(audioPath);
    }

    return audioFiles;
  }
}