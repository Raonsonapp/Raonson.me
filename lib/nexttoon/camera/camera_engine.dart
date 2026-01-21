import 'camera_motion.dart';
import 'camera_state.dart';
import 'camera_type.dart';

class CameraEngine {
  CameraState apply(CameraState state, CameraMotion motion) {
    switch (motion.type) {
      case CameraType.zoomIn:
        state.zoom += motion.intensity * 0.1;
        break;
      case CameraType.zoomOut:
        state.zoom -= motion.intensity * 0.1;
        break;
      case CameraType.pan:
        state.offsetX += motion.intensity * 5;
        break;
      case CameraType.shake:
        state.offsetX += motion.intensity;
        state.offsetY -= motion.intensity;
        break;
      case CameraType.follow:
        state.offsetX += motion.intensity * 2;
        state.offsetY += motion.intensity * 2;
        break;
      case CameraType.staticShot:
        break;
    }
    return state;
  }
}