class KingAIHistoryItem {
  final DateTime time;
  final String action;
  final bool success;

  KingAIHistoryItem({
    required this.time,
    required this.action,
    required this.success,
  });
}

class KingAIHistory {
  final List<KingAIHistoryItem> items = [];

  void add(String action, bool success) {
    items.add(
      KingAIHistoryItem(
        time: DateTime.now(),
        action: action,
        success: success,
      ),
    );
  }
}