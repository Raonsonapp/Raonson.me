import 'core/anime_style.dart';
import 'services/style_selector.dart';
import 'services/fx_composer.dart';

class StyleEngine {
  StyleEngine._();
  static final instance = StyleEngine._();

  Future<StyleResult> apply({
    required AnimeStyle style,
    required int durationSeconds,
  }) async {
    final fx = FXComposer().compose(style);
    return StyleResult(style: style, fxPreset: fx);
  }
}

class StyleResult {
  final AnimeStyle style;
  final String fxPreset;

  StyleResult({
    required this.style,
    required this.fxPreset,
  });
}