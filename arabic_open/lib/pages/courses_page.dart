import 'package:arabic_open/components/course.dart';
import 'package:flutter/material.dart';


class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffF6EDEA),
        body: Padding(

          padding: const EdgeInsets.only(left:100,right:100),
          child: ListView(children: [
        
            Course_Tile(coursename: "Course 1", onTap: (){
              Navigator.pushNamed(context, '/home');
              
            },),
            Course_Tile(coursename: "Course 2", onTap: (){
              Navigator.pushNamed(context, '/home');
              
            },),
            Course_Tile(coursename: "Course 3", onTap: (){
              Navigator.pushNamed(context, '/home');
              
            },),
              
            ]),
        )
    );
  }
}
