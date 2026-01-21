import 'camera_event.dart';
import 'camera_position.dart';

class CameraController {
  CameraPosition current =
      CameraPosition(x: 0, y: 0, zoom: 1);

  void apply(CameraEvent event) {
    if (event.move != null) {
      current = event.move!.to;
    }
  }
}