import 'package:arabic_open/components/course.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class Course_Video extends StatefulWidget {
  
  const Course_Video({super.key});
  @override
  State<Course_Video> createState() => _Course_VideoState();
}

class _Course_VideoState extends State<Course_Video> {
  YoutubePlayerController _ytcontroller = YoutubePlayerController(
    initialVideoId: "https://www.youtube.com/watch?v=hP25aVmxkP8"
    );
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6EDEA),
        body: Column(
          children: [
            Container(
              child: YoutubePlayer(controller: _ytcontroller,
              ),),
            
          ],
        ),
    );
  }
}
