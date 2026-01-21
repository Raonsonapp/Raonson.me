import 'package:flutter/material.dart';

class HistoryEmptyView extends StatelessWidget {
  const HistoryEmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "No episodes yet",
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    );
  }
}