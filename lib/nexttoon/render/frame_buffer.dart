import 'frame_model.dart';

class FrameBuffer {
  final List<FrameModel> frames = [];

  void add(FrameModel frame) {
    frames.add(frame);
  }
}