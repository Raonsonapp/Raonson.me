import 'package:flutter/material.dart';

class TimelineFrame {
  final int index;
  final Duration start;
  final Duration end;
  final Widget visualLayer;
  final String sceneId;

  TimelineFrame({
    required this.index,
    required this.start,
    required this.end,
    required this.visualLayer,
    required this.sceneId,
  });
}