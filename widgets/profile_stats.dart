import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  Widget _item(String count, String label) {
    return Column(
      children: [
        Text(count,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        Text(label, style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _item('128', 'Posts'),
        _item('4.5K', 'Followers'),
        _item('312', 'Following'),
      ],
    );
  }
}
