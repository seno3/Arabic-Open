import 'package:flutter/material.dart';

class Course_Tile extends StatelessWidget {
  final String coursename;
  final void Function()? onTap;
  const Course_Tile({super.key, required this.coursename, required this.onTap});
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        coursename,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset('lib/images/arabic.png'),
                      ),
                    ],
                  )),
    );
  }
}