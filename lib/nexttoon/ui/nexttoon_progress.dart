import 'package:flutter/material.dart';
import '../state/nexttoon_state.dart';

class NextToonProgress extends StatelessWidget {
  final NextToonState state;
  const NextToonProgress(this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(state.stage),
        LinearProgressIndicator(value: state.progress),
      ],
    );
  }
}