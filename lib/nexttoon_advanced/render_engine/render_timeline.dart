import 'render_frame.dart';

class RenderTimeline {
  final List<RenderFrame> frames = [];

  void addFrame(RenderFrame frame) {
    frames.add(frame);
  }

  int get totalFrames => frames.length;
}