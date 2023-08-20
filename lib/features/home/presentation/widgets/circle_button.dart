import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  const CircleButton({super.key, required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
      width: 40.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: kPrimaryLight),
      child: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
