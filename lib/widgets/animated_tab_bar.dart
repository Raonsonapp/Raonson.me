import 'package:flutter/material.dart';

class AnimatedTabBar extends StatelessWidget {
  final int index;
  final Function(int) onChanged;

  const AnimatedTabBar({
    super.key,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (i) {
          return GestureDetector(
            onTap: () => onChanged(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: index == i ? 50 : 40,
              height: index == i ? 50 : 40,
              decoration: BoxDecoration(
                color: index == i ? Colors.white : Colors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icons[i],
                color: index == i ? Colors.black : Colors.white,
              ),
            ),
          );
        }),
      ),
    );
  }
}

const _icons = [
  Icons.home,
  Icons.search,
  Icons.add_circle_outline,
  Icons.play_circle,
  Icons.person,
];
