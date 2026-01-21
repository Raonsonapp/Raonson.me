// media/ui/quality_selector.dart

import 'package:flutter/material.dart';
import '../services/media_quality_service.dart';

class QualitySelector extends StatefulWidget {
  final MediaQualityService service;

  const QualitySelector({super.key, required this.service});

  @override
  State<QualitySelector> createState() => _QualitySelectorState();
}

class _QualitySelectorState extends State<QualitySelector> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<VideoQuality>(
      value: widget.service.current,
      items: VideoQuality.values.map((q) {
        return DropdownMenuItem(
          value: q,
          child: Text(q.name.replaceFirst('q', '') + 'p'),
        );
      }).toList(),
      onChanged: (q) {
        if (q != null) {
          setState(() {
            widget.service.setQuality(q);
          });
        }
      },
    );
  }
}