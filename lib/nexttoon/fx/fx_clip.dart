import 'fx_type.dart';
import 'fx_frame.dart';

class FxClip {
  final String id;
  final FxType type;
  final List<FxFrame> frames;

  FxClip({
    required this.id,
    required this.type,
    required this.frames,
  });
}
