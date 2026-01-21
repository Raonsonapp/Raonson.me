import 'fx_type.dart';

class FXLayer {
  final FXType type;
  final double intensity;
  final Duration startAt;
  final Duration duration;

  FXLayer({
    required this.type,
    required this.intensity,
    required this.startAt,
    required this.duration,
  });
}
