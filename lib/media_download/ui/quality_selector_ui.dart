import 'package:flutter/material.dart';
import '../models/video_quality.dart';
import '../services/quality_selector.dart';

class QualitySelectorUI extends StatelessWidget {
  final Function(VideoQuality) onSelect;
  const QualitySelectorUI({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: VideoQuality.values.map((q) {
        return ListTile(
          title: Text(QualitySelector.label(q)),
          onTap: () => onSelect(q),
        );
      }).toList(),
    );
  }
}