import 'package:flutter/material.dart';

class UploadTypeSelector extends StatelessWidget {
  final String selected;
  final Function(String) onSelect;

  const UploadTypeSelector({
    super.key,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final types = ['Post', 'Story', 'Reel'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: types.map((type) {
        final isActive = selected == type;
        return GestureDetector(
          onTap: () => onSelect(type),
          child: Text(
            type,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: isActive ? Colors.black : Colors.grey,
            ),
          ),
        );
      }).toList(),
    );
  }
}
