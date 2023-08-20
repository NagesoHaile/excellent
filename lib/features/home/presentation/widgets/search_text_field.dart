import 'package:flutter/material.dart';

import '../../../constants/color.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
            size: 26.0,
          ),
          suffixIcon: const Icon(
            Icons.mic,
            color: kPrimaryColor,
            size: 26.0,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelText: "Search your topic",
          labelStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.white,
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(40.0)),
          isDense: true),
    );
  }
}
