import 'package:flutter/material.dart';

class Insayt extends StatelessWidget {
  const Insayt({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle =
        TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
    return Container(
      child: Text(
        'Insayt',
        style: optionStyle,
      ),
    );
  }
}
