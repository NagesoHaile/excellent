import 'package:flutter/material.dart';

import '../../../../models/course.dart';
import '../../widgets/course_container.dart';

class Explore extends StatelessWidget {
  const Explore({super.key});

  @override
  Widget build(BuildContext context) {
    const TextStyle optionStyle = TextStyle(
        fontSize: 30, fontWeight: FontWeight.w600, color: Colors.white60);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          backgroundColor: Color(0xFF212121),
          title: Container(
            height: 40.0,
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                filled: true,
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                fillColor: Color(0xff212121),
              ),
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return CourseContainer(
                  course: courses[index],
                );
              },
              separatorBuilder: (context, _) {
                return const SizedBox(
                  height: 10.0,
                );
              },
              itemCount: courses.length),
        ),
      ),
    );
  }
}
