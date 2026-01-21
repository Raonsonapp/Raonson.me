import 'fx_stack.dart';
import 'fx_renderer.dart';

class FXPipeline {
  final FXStack stack = FXStack();
  late final FXRenderer renderer;

  FXPipeline() {
    renderer = FXRenderer(stack);
  }

  void render(Duration frameTime) {
    renderer.renderFrame(frameTime);
  }
}