import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/color.dart';
import '../../../models/lesson.dart';
import '../widgets/custom_icon_button.dart';
import '../widgets/lesson_card.dart';
import '../widgets/video_items.dart';

class DetailScreen extends StatefulWidget {
  final String title;
  const DetailScreen({super.key, required this.title});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late VideoPlayerController controller;
  int _selectedTag = 0;
  void changeTab(int index) {
    setState(() {
      _selectedTag = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.dark,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IntrinsicHeight(
                      child: Stack(
                        children: [
                          const Align(
                            child: Text(
                              'Physics',
                              style: TextStyle(color: Colors.brown),
                            ),
                          ),
                          const SizedBox(
                            height: 30.0,
                          ),
                          Positioned(
                              left: 0,
                              child: CustomIconButton(
                                child: const Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Icon(
                                    Icons.cancel_rounded,
                                    color: Colors.brown,
                                  ),
                                ),
                                height: 35.0,
                                width: 35.0,
                                onTap: () => Navigator.pop(context),
                              ))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    AspectRatio(
                      aspectRatio: 3 / 2,
                      child: VideoItems(
                        videoPlayerController: controller,
                        looping: true,
                        autoplay: false,
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Physics Grade 11',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          const Text(
                            'Newton\'s First Law of motion',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          const Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.brown,
                              ),
                              Text(
                                '4.8',
                                style: TextStyle(
                                  color: Colors.brown,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Icon(
                                Icons.timer,
                                color: Colors.brown,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                '3 hours',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Colors.brown,
                                ),
                              ),
                              Spacer(),
                              Text(
                                '99.99 ETB',
                                style: TextStyle(
                                    color: Colors.brown, fontSize: 16.0),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 15.0,
                          ),
                          CustomTabView(
                            index: _selectedTag,
                            changeTab: changeTab,
                          ),
                          // _selectedTag == 0
                          //     ? const Playlist()
                          //     : const Description(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class Description extends StatelessWidget {
  const Description({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Text(
        'Something that is better than the usual one.',
        style: TextStyle(color: Colors.white60),
      ),
    );
  }
}

class CustomTabView extends StatefulWidget {
  final Function changeTab;
  final int index;
  const CustomTabView(
      {super.key, required this.changeTab, required this.index});

  @override
  State<CustomTabView> createState() => _CustomTabViewState();
}

class _CustomTabViewState extends State<CustomTabView> {
  final List<String> _tags = [
    "Playlist (32)",
    "Description",
  ];

  Widget _buildTags(int index) {
    return GestureDetector(
      onTap: () {
        widget.changeTab(index);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * .08, vertical: 15),
        decoration: BoxDecoration(
          color: widget.index == index ? kPrimaryColor : null,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Text(
          _tags[index],
          style: TextStyle(
              color: widget.index == index ? Colors.white : kPrimaryColor),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey.shade200,
      ),
      child: Row(
          children: _tags
              .asMap()
              .entries
              .map((MapEntry map) => _buildTags(map.key))
              .toList()),
    );
  }
}

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        shrinkWrap: true,
        padding: const EdgeInsets.only(top: 20.0, bottom: 40.0),
        itemBuilder: (_, index) {
          return LessonCard(lesson: lessonList[index]);
        },
        separatorBuilder: (_, __) {
          return const SizedBox(
            height: 20.0,
          );
        },
        itemCount: lessonList.length,
      ),
    );
  }
}
