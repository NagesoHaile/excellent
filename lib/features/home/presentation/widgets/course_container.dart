import 'package:flutter/material.dart';

import '../../../constants/color.dart';
import '../../../models/course.dart';
import '../screens/detail_screen.dart';

class CourseContainer extends StatelessWidget {
  final Course course;
  const CourseContainer({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailScreen(title: course.name)));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Colors.grey.shade900,
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Icon(
              Icons.laptop_chromebook,
              size: 50.0,
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(course.name),
                Text(
                  'Auther: ${course.author}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                const SizedBox(
                  height: 5.0,
                ),
                LinearProgressIndicator(
                  value: course.completedPercentage,
                  backgroundColor: Colors.grey.shade100,
                  color: Color(0xffff6600),
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}
