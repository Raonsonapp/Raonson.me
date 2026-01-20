import '../core/directive.dart';
import '../../video/core/scene.dart';
import '../../video/core/shot.dart';

class ScenePlanner {
  Scene plan(Directive directive, int index) {
    return Scene(
      id: 'scene_$index',
      shots: [
        Shot(
          assetId: directive.action,
          start: 0,
          end: directive.duration.toDouble(),
          animationId: 'cinematic',
        )
      ],
      duration: directive.duration.toDouble(),
    );
  }
}