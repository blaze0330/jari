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
      padding: EdgeInsets.all(50.0),
  width: width,
  height: height,
  decoration: BoxDecoration(
    boxShadow: [
      BoxShadow(
        color: Colors.white,
        offset: Offset(-4.0, -4.0),
        blurRadius: 16.0,
        spreadRadius: 1
      ),
      BoxShadow(
        color: Colors.grey.shade500,
        offset: Offset(4.0, 4.0),
        blurRadius: 16.0,
        spreadRadius: 1
      ),
    ],
    color: Colors.grey[300],
    borderRadius: BorderRadius.circular(12.0),
  ),
  child: child,
);

  }
}