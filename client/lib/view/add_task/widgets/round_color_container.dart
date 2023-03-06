import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ColouredContainer extends StatelessWidget {
  final child;
  final double height;
  final double width;
  final radius;
  final Color color;
  const ColouredContainer({super.key, required this.height, required this.width, required this.radius, required this.color, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: color,
      ),
      child: child,
    );
  }
}