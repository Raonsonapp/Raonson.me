import 'camera_position.dart';

class CameraMove {
  final CameraPosition from;
  final CameraPosition to;
  final Duration duration;

  CameraMove({
    required this.from,
    required this.to,
    required this.duration,
  });
}