import '../core/scene.dart';
import '../core/shot.dart';

class SceneBuilder {
  List<Scene> expand(List<Scene> base) {
    // 1 scene → 6–12 shots (аниме стандарт)
    return base.map((scene) {
      final shots = List.generate(
        scene.shots.length * 3,
        (i) => Shot(
          id: '${scene.id}_shot_$i',
          duration: 3 + (i % 2),
          camera: i % 2 == 0 ? 'close' : 'wide',
          poses: scene.shots.first.poses,
        ),
      );

      return Scene(
        id: scene.id,
        description: scene.description,
        shots: shots,
      );
    }).toList();
  }
}