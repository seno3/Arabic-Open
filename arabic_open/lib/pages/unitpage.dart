import 'package:arabic_open/components/button.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class UnitPage extends StatelessWidget {
  const UnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Videos"),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: MyButton(
            icon1: Icons.arrow_forward,
            text: "Get Started",
            onTap: () {
              // go to home
              Navigator.pushNamed(context, '/video');
            },
          ),
        ),
        Text("Quizzes"),
      ]),
    );
  }
}
