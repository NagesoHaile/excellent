import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:excellent/features/home/presentation/widgets/custom_icon_button.dart';
import 'package:video_player/video_player.dart';

class CustomVideoPlayer extends StatefulWidget {
  final bool looping;
  final bool autoplay;
  final VideoPlayerController controller;

  const CustomVideoPlayer(
      {super.key,
      required this.looping,
      required this.autoplay,
      required this.controller});

  @override
  State<CustomVideoPlayer> createState() => _CustomVideoPlayerState();
}

class _CustomVideoPlayerState extends State<CustomVideoPlayer> {
  Future<void>? _initializeVideoPlayerFuture;
  late VideoPlayerController controller;
  late ChewieController chewieController;

  Widget? controls;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = VideoPlayerController.networkUrl(
      Uri.parse(
          'https://www.youtube.com/watch?v=LXenv9tTfY4&list=RDLXenv9tTfY4&start_radio=1'),
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    );
    chewieController = ChewieController(
        videoPlayerController: widget.controller,
        aspectRatio: 5 / 8,
        autoInitialize: true,
        autoPlay: widget.autoplay,
        looping: widget.looping,
        errorBuilder: (context, message) {
          return Center(
            child: Text(
              message,
              style: TextStyle(color: Colors.white),
            ),
          );
        });
    // final playerWidget = Chewie(
    //   controller: chewieController,
    // );

    _initializeVideoPlayerFuture = controller.initialize();

    controller.addListener(() {
      if (controller.value.isPlaying) {
        controls = CustomIconButton(
            child: Icon(Icons.pause),
            height: 30.0,
            width: 30.0,
            onTap: () {
              setState(() {
                controller.pause();
              });
            });
      } else if (controller.value.position.inMicroseconds -
              controller.value.duration.inMicroseconds <
          1) {
        controls = CustomIconButton(
            child: Icon(Icons.play_arrow),
            height: 30.0,
            width: 30.0,
            onTap: () {
              setState(() {
                controller.play();
              });
            });
      } else {
        controls = CustomIconButton(
            child: Icon(Icons.play_arrow),
            height: 30.0,
            width: 30.0,
            onTap: () {
              setState(() {
                controller.play();
              });
            });
      }
    });
    controller.setLooping(true);
    controller.initialize().then((_) => setState(() {}));

    controller.play();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    chewieController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: controller.value.aspectRatio,
            child: Stack(
              children: [
                VideoPlayer(controller),
                Positioned.fill(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [controls ?? Container()],
                )),
                VideoProgressIndicator(controller, allowScrubbing: true),
                //  _ControlsOverlay(controller: controller),
              ],
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: Colors.green),
          );
        }
      },
    );

    // AspectRatio(
    //   aspectRatio: controller.value.aspectRatio,
    //   child: Stack(
    //     children: [
    //       VideoPlayer(controller),
    //       Positioned.fill(
    //           child: Row(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [controls ?? Container()],
    //       )),
    //       _ControlsOverlay(controller: controller),
    //       VideoProgressIndicator(controller, allowScrubbing: true),
    //     ],
    //   ),
    // );
  }
}

class _ControlsOverlay extends StatelessWidget {
  final VideoPlayerController controller;
  _ControlsOverlay({super.key, required this.controller});

  static const List<Duration> _exampleCaptionOffsets = <Duration>[
    Duration(seconds: -10),
    Duration(seconds: -3),
    Duration(seconds: -1, milliseconds: -500),
    Duration(milliseconds: -250),
    Duration.zero,
    Duration(milliseconds: 250),
    Duration(seconds: 1, milliseconds: 500),
    Duration(seconds: 3),
    Duration(seconds: 10),
  ];

  static const List<double> _examplePlaybackRates = <double>[
    0.25,
    0.5,
    1.0,
    1.5,
    2.0,
    3.0,
    5.0,
    10.0,
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          reverseDuration: const Duration(milliseconds: 200),
          child: controller.value.isPlaying
              ? const SizedBox.shrink()
              : Container(
                  color: Colors.black26,
                  child: const Center(
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.white,
                      size: 100.0,
                      semanticLabel: 'Play',
                    ),
                  ),
                ),
        ),
        GestureDetector(
          onTap: () {
            controller.value.isPlaying ? controller.pause() : controller.play();
          },
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: PopupMenuButton<Duration>(
            initialValue: controller.value.captionOffset,
            tooltip: 'Caption Offset',
            onSelected: (Duration delay) {
              controller.setCaptionOffset(delay);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<Duration>>[
                for (final Duration offsetDuration in _exampleCaptionOffsets)
                  PopupMenuItem<Duration>(
                    value: offsetDuration,
                    child: Text('${offsetDuration.inMilliseconds}ms'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.captionOffset.inMilliseconds}ms'),
            ),
          ),
        ),
        // ////////////////////////
        Align(
          alignment: Alignment.bottomRight,
          child: PopupMenuButton<double>(
            initialValue: controller.value.playbackSpeed,
            tooltip: 'Playback speed',
            onSelected: (double speed) {
              controller.setPlaybackSpeed(speed);
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<double>>[
                for (final double speed in _examplePlaybackRates)
                  PopupMenuItem<double>(
                    value: speed,
                    child: Text('${speed}x'),
                  )
              ];
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                // Using less vertical padding as the text is also longer
                // horizontally, so it feels like it would need more spacing
                // horizontally (matching the aspect ratio of the video).
                vertical: 12,
                horizontal: 16,
              ),
              child: Text('${controller.value.playbackSpeed}x'),
            ),
          ),
        ),
      ],
    );
  }
}
