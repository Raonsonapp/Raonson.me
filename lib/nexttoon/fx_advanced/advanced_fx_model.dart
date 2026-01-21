import 'advanced_fx_type.dart';

class AdvancedFxModel {
  final AdvancedFxType type;
  final Duration start;
  final Duration duration;
  final double power;
  final String layerId;

  AdvancedFxModel({
    required this.type,
    required this.start,
    required this.duration,
    required this.power,
    required this.layerId,
  });
}