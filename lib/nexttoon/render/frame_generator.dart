import 'render_config.dart';
import 'frame_model.dart';
import 'frame_buffer.dart';

class FrameGenerator {
  final RenderConfig config;

  FrameGenerator(this.config);

  FrameBuffer generate(Duration duration) {
    final buffer = FrameBuffer();
    final totalFrames =
        (duration.inMilliseconds / (1000 / config.fps)).floor();

    for (int i = 0; i < totalFrames; i++) {
      buffer.add(FrameModel(
        index: i,
        time: Duration(
          milliseconds:
              (i * (1000 / config.fps)).floor(),
        ),
      ));
    }
    return buffer;
  }
}