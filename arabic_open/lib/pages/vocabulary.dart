import 'package:arabic_open/components/button.dart';
import 'package:flutter/material.dart';

class VocabularyPage extends StatelessWidget {
  const VocabularyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Practice your Arabic words"),
        MyButton(text: "START", onTap: () {
          Navigator.pushNamed(context, '/flashcards');
        }, icon1: Icons.add_alert_rounded)
      ]),
    );
  }
}