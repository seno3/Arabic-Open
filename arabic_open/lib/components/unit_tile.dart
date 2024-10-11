import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Unit_Tile extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  const Unit_Tile({super.key, required this.onTap, required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(children: [
        Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 50, right: 50, bottom: 25),
            padding: const EdgeInsets.all(50),
            child: Row(
              children: [
                Center(
                  child: Text(
                    title,
                    style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ))
      ]),
    );
  }
}