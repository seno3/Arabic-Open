import 'package:flutter/material.dart';

class FlashcardView extends StatelessWidget {

  final String text;
  const FlashcardView({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Card(
                  semanticContainer: true,
                  elevation: 4,
                  child: Center(
                    child: Text(
                      text,
                      textAlign: TextAlign.center,
                      )),
                );
  }
}