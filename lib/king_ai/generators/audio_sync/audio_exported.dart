import '../generation_result.dart';

class AudioExporter {
  GeneratedFile export(Map<String, dynamic> payload) {
    return GeneratedFile(
      path: "nexttoon/audio/audio_payload.json",
      content: payload.toString(),
    );
  }
}
