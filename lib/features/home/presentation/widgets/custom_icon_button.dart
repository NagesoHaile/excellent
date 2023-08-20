import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final Widget child;
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color? color;
  const CustomIconButton(
      {super.key,
      required this.child,
      required this.height,
      required this.width,
      required this.onTap,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(child: child),
    );
  }
}
