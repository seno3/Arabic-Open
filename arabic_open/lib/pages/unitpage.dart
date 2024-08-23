import 'package:flutter/material.dart';

class UnitPage extends StatelessWidget {
  const UnitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Videos"),
        Text("Quizzes"),
      ]),
    );
  }
}