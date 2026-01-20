import 'shot.dart';

class Scene {
  final String id;
  final String description;
  final List<Shot> shots;

  Scene({
    required this.id,
    required this.description,
    required this.shots,
  });
}