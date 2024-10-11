import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Course_Tile extends StatelessWidget {
  final String coursename;
  final void Function()? onTap;
  final String  imagePath;
  const Course_Tile({super.key, required this.coursename, required this.onTap, required this.imagePath});
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
                  margin: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.grey, width: 2)),
                  child: Row(
                    children: [
                      Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(imagePath),
                          ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            coursename,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.dmSerifDisplay(
                    color: Colors.black,
                    fontSize: 48,
                    height: 2,
                  )
                          ),
                        ],
                      ),
                    ],
                  )),
    );
  }
}