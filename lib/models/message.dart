class Message {
  final String from;
  final String to;
  final String text;
  final String time;

  Message({
    required this.from,
    required this.to,
    required this.text,
    required this.time,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      from: json['from'],
      to: json['to'],
      text: json['text'],
      time: json['time'],
    );
  }
}
