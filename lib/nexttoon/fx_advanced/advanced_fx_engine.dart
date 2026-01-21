import 'advanced_fx_layer.dart';
import 'advanced_fx_model.dart';

class AdvancedFxEngine {
  final List<AdvancedFxLayer> layers = [];

  void addEffect(AdvancedFxModel fx) {
    final layer = layers.firstWhere(
      (l) => l.id == fx.layerId,
      orElse: () {
        final newLayer =
            AdvancedFxLayer(id: fx.layerId, effects: []);
        layers.add(newLayer);
        return newLayer;
      },
    );

    layer.effects.add(fx);
  }
}