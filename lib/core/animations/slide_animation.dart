import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {
  final Widget child;
  final Offset begin;
  final Offset end;
  final Duration duration;

  const SlideAnimation({
    super.key,
    required this.child,
    this.begin = const Offset(0, 0.1),
    this.end = Offset.zero,
    this.duration = const Duration(milliseconds: 300),
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: end),
      duration: duration,
      curve: Curves.easeOut,
      builder: (context, value, _) {
        return Transform.translate(
          offset: Offset(
            value.dx * MediaQuery.of(context).size.width,
            value.dy * MediaQuery.of(context).size.height,
          ),
          child: child,
        );
      },
    );
  }
}
