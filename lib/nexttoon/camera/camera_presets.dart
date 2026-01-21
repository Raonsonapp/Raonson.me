import 'camera_motion.dart';
import 'camera_type.dart';

class CameraPresets {
  static CameraMotion dramaticZoom() => CameraMotion(
        type: CameraType.zoomIn,
        start: Duration.zero,
        duration: const Duration(seconds: 2),
        intensity: 1.2,
      );

  static CameraMotion battleShake() => CameraMotion(
        type: CameraType.shake,
        start: Duration.zero,
        duration: const Duration(milliseconds: 500),
        intensity: 3.0,
      );
}