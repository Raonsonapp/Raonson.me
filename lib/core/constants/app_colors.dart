import 'package:flutter/material.dart';

class AppColors {
  static const Color primary = Color(0xFF3897F0); // Instagram blue
  static const Color secondary = Color(0xFF262626);
  static const Color background = Colors.white;
  static const Color darkBackground = Colors.black;

  static const Color textPrimary = Color(0xFF262626);
  static const Color textSecondary = Color(0xFF8E8E8E);

  static const Color border = Color(0xFFDBDBDB);
  static const Color error = Colors.red;
  static const Color success = Colors.green;

  static const LinearGradient instagramGradient = LinearGradient(
    colors: [
      Color(0xFFFEDA75),
      Color(0xFFFA7E1E),
      Color(0xFFD62976),
      Color(0xFF962FBF),
      Color(0xFF4F5BD5),
    ],
  );
}
