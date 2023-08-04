import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  const Circle({super.key, this.radius = 30, this.color, this.child});
  final double radius;
  final Color? color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      // radius: radius,
      maxRadius: radius,
      minRadius: radius,
      backgroundColor: color,
      child: ClipOval(clipBehavior: Clip.hardEdge, child: child
          // const Icon(
          //   Icons.person,
          //   size: 30,
          //   color: Colors.grey,
          // ),
          ),
    );
  }
}
