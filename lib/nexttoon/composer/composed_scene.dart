import 'package:flutter/material.dart';

class ComposedScene {
  final String sceneId;
  final Duration start;
  final Duration end;
  final Widget visual;
  final String audioPath;

  ComposedScene({
    required this.sceneId,
    required this.start,
    required this.end,
    required this.visual,
    required this.audioPath,
  });
}