import 'package:flutter/material.dart';

class Placeholder extends StatelessWidget {
  const Placeholder({
    super.key,
    this.width = 70,
    this.height = 24,
    this.borderRadius = 8,
    this.child,
    this.all,
  });

  final double width;
  final double height;
  final double borderRadius;
  final double? all;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: all ?? width,
      height: all ?? height,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(all ?? borderRadius),
          color: Colors.lightBlue.shade100),
      child: child,
    );
  }
}
