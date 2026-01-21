import 'package:flutter/material.dart';

import '../state/generation_status.dart';

class GeneratorStatusBadge extends StatelessWidget {
  final GenerationStatus status;

  const GeneratorStatusBadge({
    super.key,
    required this.status,
  });

  Color get _color {
    switch (status) {
      case GenerationStatus.running:
        return Colors.blue;
      case GenerationStatus.completed:
        return Colors.green;
      case GenerationStatus.failed:
        return Colors.red;
      case GenerationStatus.paused:
        return Colors.orange;
      case GenerationStatus.queued:
        return Colors.grey;
      default:
        return Colors.black;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(status.name.toUpperCase()),
      backgroundColor: _color.withOpacity(0.15),
      labelStyle: TextStyle(color: _color),
    );
  }
}