import 'dart:io';
import 'package:flutter/material.dart';
import 'media_picker.dart';
import 'caption_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  File? selectedFile;

  Future<void> _pickGallery() async {
    final file = await MediaPicker.pickFromGallery();
    if (file != null) setState(() => selectedFile = file);
  }

  Future<void> _pickCamera() async {
    final file = await MediaPicker.pickFromCamera();
    if (file != null) setState(() => selectedFile = file);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create')),
      body: selectedFile == null
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.add_photo_alternate, size: 80),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _pickGallery,
                    child: const Text('From Gallery'),
                  ),
                  const SizedBox(height: 8),
                  OutlinedButton(
                    onPressed: _pickCamera,
                    child: const Text('Use Camera'),
                  ),
                ],
              ),
            )
          : Column(
              children: [
                Image.file(
                  selectedFile!,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 48),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) =>
                              CaptionScreen(file: selectedFile!),
                        ),
                      );
                    },
                    child: const Text('Next'),
                  ),
                )
              ],
            ),
    );
  }
}
