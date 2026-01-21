import 'camera_type.dart';

class CameraMotion {
  final CameraType type;
  final Duration start;
  final Duration duration;
  final double intensity;

  CameraMotion({
    required this.type,
    required this.start,
    required this.duration,
    required this.intensity,
  });
}