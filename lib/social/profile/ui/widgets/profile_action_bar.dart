import 'package:flutter/material.dart';

class ProfileActionBar extends StatelessWidget {
  final VoidCallback onMessage;
  final VoidCallback onShare;

  const ProfileActionBar({
    super.key,
    required this.onMessage,
    required this.onShare,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(icon: const Icon(Icons.message), onPressed: onMessage),
        IconButton(icon: const Icon(Icons.share), onPressed: onShare),
      ],
    );
  }
}
