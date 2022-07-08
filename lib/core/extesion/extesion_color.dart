import 'package:flutter/material.dart';

import 'dart:math';

extension ColorExtension on Color {
  static Color get random {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  String get string =>
      '#${value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
}
