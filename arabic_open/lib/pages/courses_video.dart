import 'package:arabic_open/components/course.dart';
import 'package:flutter/material.dart';
import 'package:flutter_youtube_view/flutter_youtube_view.dart';

class CourseVideo extends StatefulWidget {
  const CourseVideo({super.key});

  @override
  State<CourseVideo> createState() => _CourseVideoState();
}

class _CourseVideoState extends State<CourseVideo> implements YouTubePlayerListener {
  late FlutterYoutubeViewController _controller;

  @override
  void onReady() {
    _controller.loadOrCueVideo("yhLwtODnTEw", 0.0);
  }

  @override
  void onStateChange(String state) {
    // Handle state changes if needed
  }

  @override
  void onError(String error) {
    // Handle errors if needed
  }

  @override
  void onCurrentSecond(double second) {
    // Handle the event when the video reaches a certain second
  }

  @override
  void onVideoDuration(double duration) {
    // Handle the event when the video's duration is known
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF6EDEA),
      body: Column(
        children: [
          Expanded(
            child: FlutterYoutubeView(
              onViewCreated: (controller) {
                _controller = controller;
              },
              listener: this,
              scaleMode: YoutubeScaleMode.none, // Choose your preferred scale mode
              params: const YoutubeParam(
                videoId: "yhLwtODnTEw",
                showUI: true,
                startSeconds: 0.0,
                autoPlay: true,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // No need to remove the listener explicitly as it is handled by the Flutter framework
    super.dispose();
  }
}