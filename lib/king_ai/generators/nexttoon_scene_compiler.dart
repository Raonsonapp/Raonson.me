class SceneCompiler {
  List<Map<String, dynamic>> compileScenes(int minutes) {
    final scenes = <Map<String, dynamic>>[];
    final sceneCount = minutes * 6; // ~10 sec per scene

    for (int s = 0; s < sceneCount; s++) {
      scenes.add({
        "scene_id": s + 1,
        "shots": _buildShots(),
      });
    }
    return scenes;
  }

  List<Map<String, dynamic>> _buildShots() {
    final shots = <Map<String, dynamic>>[];
    for (int i = 0; i < 4; i++) {
      shots.add({
        "shot_id": i + 1,
        "frames": _buildFrames(),
        "camera": "dynamic",
        "lighting": "anime_cinematic",
      });
    }
    return shots;
  }

  List<Map<String, dynamic>> _buildFrames() {
    return List.generate(24, (i) {
      return {
        "frame": i + 1,
        "motion": "interpolated",
        "fx": ["blur", "glow"],
      };
    });
  }
}