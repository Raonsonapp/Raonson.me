import 'frame_composer.dart';

class FrameBatchBuilder {
  final FrameComposer composer = FrameComposer();

  List<Map<String, dynamic>> buildBatch({
    required int frameCount,
    required String style,
  }) {
    return List.generate(frameCount, (i) {
      return composer.composeFrame(
        frameIndex: i + 1,
        style: style,
      );
    });
  }
}
