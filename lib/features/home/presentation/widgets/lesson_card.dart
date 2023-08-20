import 'package:flutter/material.dart';

import '../../../models/lesson.dart';

class LessonCard extends StatelessWidget {
  final Lesson lesson;
  const LessonCard({super.key, required this.lesson});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        lesson.isPlaying
            ? Icon(
                Icons.laptop_chromebook,
                color: Colors.white38,
              )
            : Icon(
                Icons.play_arrow,
                color: Colors.white38,
              ),
        const SizedBox(
          width: 15.0,
        ),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              lesson.name,
              style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white54),
            )
          ],
        ))
      ],
    );
  }
}
