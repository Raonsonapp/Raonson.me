import 'camera_clip.dart';

class CameraLayer {
  final String sceneId;
  final List<CameraClip> clips;

  CameraLayer({
    required this.sceneId,
    required this.clips,
  });

  void addClip(CameraClip clip) {
    clips.add(clip);
  }
}