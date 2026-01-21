import 'package:flutter/material.dart';
import '../models/video_quality.dart';
import 'quality_selector_ui.dart';

class DownloadSheet extends StatelessWidget {
  final Function(VideoQuality) onSelect;
  const DownloadSheet({required this.onSelect, super.key});

  @override
  Widget build(BuildContext context) {
    return BottomSheet(
      onClosing: () {},
      builder: (_) => QualitySelectorUI(onSelect: onSelect),
    );
  }
}
