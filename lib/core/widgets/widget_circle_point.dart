import 'package:flutter/material.dart';

class CirclePoint extends StatelessWidget {
  final Color color;
  final double radius;

  const CirclePoint({
    Key? key,
    this.color = Colors.red,
    this.radius = 6,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 2 * radius,
      height: 2 * radius,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
