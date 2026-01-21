import 'fx_layer.dart';

class FXStack {
  final List<FXLayer> layers = [];

  void add(FXLayer layer) {
    layers.add(layer);
  }

  List<FXLayer> activeAt(Duration time) {
    return layers.where((l) =>
      time >= l.startAt &&
      time <= l.startAt + l.duration
    ).toList();
  }
}