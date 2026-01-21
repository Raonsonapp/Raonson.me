// media/ui/upload_button.dart

import 'package:flutter/material.dart';
import '../services/media_upload_service.dart';

class UploadButton extends StatelessWidget {
  final MediaUploadService service;

  const UploadButton({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      icon: const Icon(Icons.upload),
      label: const Text('Upload Media'),
      onPressed: () async {
        await service.uploadMock();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Upload completed')),
        );
      },
    );
  }
}