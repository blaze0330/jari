import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NeuMorphism extends StatelessWidget {
  final double height;
  final double width;
  final Widget child;
  const NeuMorphism({super.key, required this.height, required this.width, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
  width: width,
  height: height,
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white.withOpacity(0.9),
        offset: Offset(-6.0, -6.0),
        blurRadius: 16.0,
      ),
      BoxShadow(
        color: Colors.black.withOpacity(0.2),
        offset: Offset(6.0, 6.0),
        blurRadius: 16.0,
      ),
    ],
    color: Color(0xFFEFEEEE),
    borderRadius: BorderRadius.circular(12.0),
  ),
  child: child,
);

  }
}