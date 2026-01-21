import 'package:flutter/material.dart';
import '../state/king_ai_state.dart';

class KingAIProgress extends StatelessWidget {
  final KingAIState state;

  const KingAIProgress({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(value: state.progress),
          const SizedBox(height: 16),
          Text(state.message ?? 'Processing...'),
          const SizedBox(height: 8),
          Text('${(state.progress * 100).toInt()}%'),
        ],
      ),
    );
  }
}