import 'package:flutter/material.dart';
import 'camera_state.dart';

class CameraView extends StatelessWidget {
  final CameraState state;
  final Widget child;

  const CameraView({
    super.key,
    required this.state,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(state.offsetX, state.offsetY),
      child: Transform.scale(
        scale: state.zoom,
        child: child,
      ),
    );
  }
}