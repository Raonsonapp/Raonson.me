import 'camera_type.dart';
import 'camera_frame.dart';

class CameraClip {
  final String id;
  final CameraType type;
  final List<CameraFrame> frames;

  CameraClip({
    required this.id,
    required this.type,
    required this.frames,
  });
}
