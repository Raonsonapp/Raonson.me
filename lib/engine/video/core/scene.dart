import 'shot.dart';

class Scene {
  final String id;
  final List<Shot> shots;
  final double duration; // seconds

  Scene({
    required this.id,
    required this.shots,
    required this.duration,
  });
}