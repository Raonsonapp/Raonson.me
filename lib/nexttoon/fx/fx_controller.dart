import 'fx_engine.dart';
import 'fx_model.dart';
import 'fx_layer.dart';

class FxController {
  final FxEngine engine = FxEngine();

  FxLayer apply(FxModel fx) {
    return engine.buildFx(fx);
  }
}