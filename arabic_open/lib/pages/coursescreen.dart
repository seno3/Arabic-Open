import 'package:arabic_open/components/course.dart';
import 'package:flutter/material.dart';


class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Center(child: Text('Arabic Courses'))),
        body: Padding(
          padding: const EdgeInsets.only(left:100,right:100),
          child: ListView(children: [
        
            Course_Tile(imagePath: 'lib/images/face_graphic_happy.png' ,coursename: "Beginner", onTap: (){
              Navigator.pushNamed(context, '/home');
              
            },),
            Course_Tile(imagePath: 'lib/images/face_graphic_happy_2.png' ,coursename: "Intermediate", onTap: (){
              Navigator.pushNamed(context, '/home');
              
            },),
            Course_Tile(imagePath: 'lib/images/face_graphic_happy_3.png' ,coursename: "Advanced", onTap: (){
              Navigator.pushNamed(context, '/home');
              
            },),
              
            ]),
        )
    );
  }
}
