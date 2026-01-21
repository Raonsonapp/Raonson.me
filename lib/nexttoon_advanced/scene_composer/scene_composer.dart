import 'scene_layer.dart';
import 'scene_asset.dart';
import 'scene_character.dart';
import 'scene_timeline.dart';

class SceneComposer {
  final List<SceneLayer> layers = [];
  final List<SceneAsset> assets = [];
  final List<SceneCharacter> characters = [];
  SceneTimeline? timeline;

  void addLayer(SceneLayer layer) {
    layers.add(layer);
    layers.sort((a, b) => a.order.compareTo(b.order));
  }

  void addAsset(SceneAsset asset) {
    assets.add(asset);
  }

  void addCharacter(SceneCharacter character) {
    characters.add(character);
  }

  void setTimeline(SceneTimeline timeline) {
    this.timeline = timeline;
  }

  bool isReady() {
    return layers.isNotEmpty &&
        characters.isNotEmpty &&
        timeline != null;
  }
}