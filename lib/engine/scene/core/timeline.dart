class TimelineBlock {
  final String id;
  final double start;
  final double end;
  final String type; // scene / voice / fx

  TimelineBlock({
    required this.id,
    required this.start,
    required this.end,
    required this.type,
  });
}

class Timeline {
  final List<TimelineBlock> blocks;
  final double totalDuration;

  Timeline({
    required this.blocks,
    required this.totalDuration,
  });
}