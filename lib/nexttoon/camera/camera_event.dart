import 'camera_mode.dart';
import 'camera_move.dart';

class CameraEvent {
  final CameraMode mode;
  final CameraMove? move;

  CameraEvent({
    required this.mode,
    this.move,
  });
}