import 'package:flutter/material.dart';

class SaveLocalButton extends StatelessWidget {
  final VoidCallback onSave;

  const SaveLocalButton({super.key, required this.onSave});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.save),
      label: const Text("Save"),
      onPressed: onSave,
    );
  }
}