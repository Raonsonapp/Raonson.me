import 'scene_plan.dart';
import 'camera_plan.dart';
import 'fx_plan.dart';

class DirectorAI {
  CameraPlan planCamera(ScenePlan scene) {
    return CameraPlan(sceneId: scene.sceneId, style: 'cinematic');
  }

  FxPlan planFx(ScenePlan scene) {
    return FxPlan(sceneId: scene.sceneId, effects: ['fire', 'slash']);
  }
}