import 'package:flutter/material.dart';
import 'export_button.dart';
import 'save_local_button.dart';

class EpisodeActionsBar extends StatelessWidget {
  final VoidCallback onSave;
  final VoidCallback onExport;

  const EpisodeActionsBar({
    super.key,
    required this.onSave,
    required this.onExport,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SaveLocalButton(onSave: onSave),
        ExportButton(onExport: onExport),
      ],
    );
  }
}
