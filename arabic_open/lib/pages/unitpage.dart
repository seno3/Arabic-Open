import 'package:arabic_open/components/button.dart';
import 'package:arabic_open/components/unit_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UnitPage extends StatelessWidget {
  UnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:50),
              child: Text('Learn',style: TextStyle(fontSize: 24,)),
            ),
          ],
        ),
        const SizedBox(height:10),
        Unit_Tile(title:'Introduction',onTap: () => {}),
        Unit_Tile(title:'Basic Sentences',onTap: () => {}),
        Unit_Tile(title:'Numbers & Family',onTap: () => {}),
        Unit_Tile(title:'Numbers & Counting',onTap: () => {}),
        Unit_Tile(title:'Activities',onTap: () => {}),

      ],)
    );
  }
}
