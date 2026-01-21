import 'timeline_event_type.dart';

class TimelineEvent {
  final TimelineEventType type;
  final Duration at;
  final Map<String, dynamic> payload;

  TimelineEvent({
    required this.type,
    required this.at,
    required this.payload,
  });
}