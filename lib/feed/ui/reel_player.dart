import 'package:flutter/material.dart';

class ReelPlayer extends StatelessWidget {
  final String url;
  const ReelPlayer({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      color: Colors.black,
      child: const Center(
        child: Icon(Icons.play_arrow, color: Colors.white),
      ),
    );
  }
}