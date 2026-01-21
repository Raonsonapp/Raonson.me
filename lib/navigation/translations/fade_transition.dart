import 'package:flutter/material.dart';

class FadeRoute<T> extends PageRouteBuilder<T> {
  FadeRoute({required Widget page})
      : super(
          pageBuilder: (_, __, ___) => page,
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(opacity: animation, child: child);
          },
        );
}
