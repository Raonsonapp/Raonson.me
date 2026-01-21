enum LiveStatus { waiting, live, ended }

class LiveRoom {
  final String id;
  final String hostId;
  final DateTime startedAt;
  LiveStatus status;

  LiveRoom({
    required this.id,
    required this.hostId,
    required this.startedAt,
    this.status = LiveStatus.waiting,
  });
}