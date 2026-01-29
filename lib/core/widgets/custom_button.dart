import 'package:flutter/material.dart';
import '../animations/scale_animation.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  final bool filled;

  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
    this.filled = true,
  });

  @override
  Widget build(BuildContext context) {
    return ScaleAnimation(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: filled ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            border: filled
                ? null
                : Border.all(color: Colors.grey.shade400),
          ),
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: filled ? Colors.white : Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
