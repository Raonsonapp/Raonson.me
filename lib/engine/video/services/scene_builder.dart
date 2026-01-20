import '../core/scene.dart';
import '../core/shot.dart';

class SceneBuilder {
  Scene build({
    required String id,
    required List<String> assets,
  }) {
    final shots = assets.map((a) {
      return Shot(
        assetId: a,
        start: 0,
        end: 5,
        animationId: 'default',
      );
    }).toList();

    return Scene(
      id: id,
      shots: shots,
      duration: shots.length * 5,
    );
  }
}