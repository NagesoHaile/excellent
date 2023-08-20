import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../models/course.dart';
import '../widgets/course_container.dart';
import '../widgets/custom_icon_button.dart';

class CourseScreen extends StatefulWidget {
  const CourseScreen({super.key});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        // appBar: AppBar(),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IntrinsicHeight(
                  child: Stack(
                    children: [
                      Align(
                        child: Text(
                          "Physics",
                          style: Theme.of(context).textTheme.displayMedium,
                        ),
                      ),
                      Positioned(
                          left: 0.0,
                          child: CustomIconButton(
                              child: const Icon(Icons.arrow_back),
                              height: 35.0,
                              width: 35.0,
                              onTap: () => Navigator.pop(context)))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                ListView.separated(
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
                    itemCount: courses.length)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
