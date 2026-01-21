import 'advanced_fx_engine.dart';
import 'advanced_fx_model.dart';

class AdvancedFxController {
  final AdvancedFxEngine engine = AdvancedFxEngine();

  void play(AdvancedFxModel fx) {
    engine.addEffect(fx);
  }
}
