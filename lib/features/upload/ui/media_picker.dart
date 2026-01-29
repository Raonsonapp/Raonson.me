import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MediaPicker {
  static final _picker = ImagePicker();

  static Future<File?> pickFromGallery() async {
    final XFile? file =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 85);
    return file != null ? File(file.path) : null;
  }

  static Future<File?> pickFromCamera() async {
    final XFile? file =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 85);
    return file != null ? File(file.path) : null;
  }
}
