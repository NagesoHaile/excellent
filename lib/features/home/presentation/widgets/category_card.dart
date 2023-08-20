import 'package:flutter/material.dart';

import '../../../models/category.dart';
import '../screens/course_screen.dart';

class CategoryCard extends StatelessWidget {
  final Category category;
  CategoryCard({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => CourseScreen()));
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 4.0,
              spreadRadius: .05,
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Align(
            alignment: Alignment.topRight,
            child: Icon(
              Icons.laptop_chromebook,
              size: 100.0,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(category.name),
          Text(
            '${category.noOfCourses} courses',
            style: Theme.of(context).textTheme.bodySmall,
          )
        ]),
      ),
    );
  }
}
