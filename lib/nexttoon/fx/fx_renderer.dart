import 'package:flutter/material.dart';
import 'fx_layer.dart';

class FxRenderer extends StatelessWidget {
  final List<FxLayer> layers;

  const FxRenderer({super.key, required this.layers});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: layers.map((l) => l.widget).toList(),
    );
  }
}