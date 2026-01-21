class PhonemeFrame {
  final String phoneme; // A, O, M, S, etc
  final Duration start;
  final Duration end;
  final double intensity;

  PhonemeFrame({
    required this.phoneme,
    required this.start,
    required this.end,
    required this.intensity,
  });

  Map<String, dynamic> toJson() => {
        'phoneme': phoneme,
        'start_ms': start.inMilliseconds,
        'end_ms': end.inMilliseconds,
        'intensity': intensity,
      };

  static PhonemeFrame fromJson(Map<String, dynamic> json) {
    return PhonemeFrame(
      phoneme: json['phoneme'],
      start: Duration(milliseconds: json['start_ms']),
      end: Duration(milliseconds: json['end_ms']),
      intensity: (json['intensity'] as num).toDouble(),
    );
  }
}