import 'fx_stack.dart';

class FXRenderer {
  final FXStack stack;

  FXRenderer(this.stack);

  void renderFrame(Duration timestamp) {
    final activeFX = stack.activeAt(timestamp);

    for (final fx in activeFX) {
      _applyFX(fx);
    }
  }

  void _applyFX(dynamic fx) {
    // PLACEHOLDER:
    // GPU shader, particle system, AI enhancement
  }
}