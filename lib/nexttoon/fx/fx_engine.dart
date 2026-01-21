import 'fx_layer.dart';
import 'fx_clip.dart';

class FxEngine {
  final List<FxLayer> layers = [];

  void addLayer(FxLayer layer) {
    layers.add(layer);
  }

  List<FxClip> getActiveEffects(Duration time) {
    final active = <FxClip>[];

    for (final layer in layers) {
      for (final fx in layer.effects) {
        active.add(fx);
      }
    }
    return active;
  }
}