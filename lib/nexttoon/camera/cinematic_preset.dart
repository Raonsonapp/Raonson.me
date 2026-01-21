import 'camera_type.dart';

class CinematicPreset {
  final String name;
  final CameraType type;
  final double intensity;

  const CinematicPreset({
    required this.name,
    required this.type,
    required this.intensity,
  });

  static const dramaticZoom = CinematicPreset(
    name: 'Dramatic Zoom',
    type: CameraType.zoom,
    intensity: 0.9,
  );

  static const impactShake = CinematicPreset(
    name: 'Impact Shake',
    type: CameraType.shake,
    intensity: 0.85,
  );

  static const slowMo = CinematicPreset(
    name: 'Slow Motion',
    type: CameraType.slowMotion,
    intensity: 0.7,
  );
}