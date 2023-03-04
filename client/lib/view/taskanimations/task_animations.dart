import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class TaskAnimation extends StatefulWidget {
  const TaskAnimation({super.key});

  @override
  State<TaskAnimation> createState() => _TaskAnimationState();
}

class _TaskAnimationState extends State<TaskAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("TaskAnimations"),
      ),
    );
  }
}