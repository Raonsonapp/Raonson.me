import '../generation_result.dart';

class FrameExporter {
  GeneratedFile export(Map<String, dynamic> payload) {
    return GeneratedFile(
      path: "nexttoon/frames/frame_payload.json",
      content: payload.toString(),
    );
  }
}