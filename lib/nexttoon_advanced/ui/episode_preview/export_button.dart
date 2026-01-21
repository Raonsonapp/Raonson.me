import 'package:flutter/material.dart';

class ExportButton extends StatelessWidget {
  final VoidCallback onExport;

  const ExportButton({super.key, required this.onExport});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.upload),
      label: const Text("Export"),
      onPressed: onExport,
    );
  }
}