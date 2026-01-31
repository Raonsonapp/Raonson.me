import 'package:flutter/material.dart';

class DoubleTapLike extends StatefulWidget {
  final Widget child;

  const DoubleTapLike({super.key, required this.child});

  @override
  State<DoubleTapLike> createState() => _DoubleTapLikeState();
}

class _DoubleTapLikeState extends State<DoubleTapLike>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scale;
  bool showHeart = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );

    scale = Tween(begin: 0.5, end: 1.4).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut),
    );
  }

  void onDoubleTap() async {
    setState(() => showHeart = true);
    await controller.forward();
    await controller.reverse();
    setState(() => showHeart = false);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: onDoubleTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.child,
          if (showHeart)
            ScaleTransition(
              scale: scale,
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
                size: 120,
              ),
            ),
        ],
      ),
    );
  }
}
