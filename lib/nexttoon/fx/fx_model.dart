import 'fx_type.dart';

class FxModel {
  final FxType type;
  final Duration start;
  final Duration duration;
  final double intensity;

  FxModel({
    required this.type,
    required this.start,
    required this.duration,
    required this.intensity,
  });
}