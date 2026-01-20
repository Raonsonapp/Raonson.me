import 'package:flutter/material.dart';

class DeviceUtils {
  static Size screenSize(BuildContext context) =>
      MediaQuery.of(context).size;
}