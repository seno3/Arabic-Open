import 'package:arabic_open/components/button.dart';
import 'package:arabic_open/flashcards/flashcard.dart';
import 'package:arabic_open/flashcards/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class FlashCardPage extends StatefulWidget {
  const FlashCardPage({super.key});

  @override
  State<FlashCardPage> createState() => _FlashCardPageState();
}

class _FlashCardPageState extends State<FlashCardPage> {

  List<Flashcard> _flashcards = [
    Flashcard(
      question: "What is the first alphabets",
      answer: "Alif",
    ),
    Flashcard(question: "hi",answer: "yo"),
  ];

  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
          children: [
            
            const SizedBox(height:200),
            SizedBox(
              
              width: MediaQuery.of(context).size.width/1.5,
              height: MediaQuery.of(context).size.height/2.5,
              child: FlipCard(
                front: FlashcardView(
                  text: _flashcards[_currentIndex].question,
                  ),
                back: FlashcardView(
                  text: _flashcards[_currentIndex].answer,
                  ),
              ),
            ),
            const SizedBox(height:40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              MyButton(
                  icon1: Icons.arrow_back,
                  text: "Prev",
                  onTap: showPreviousCard,
              ),
              MyButton(
                  icon1: Icons.arrow_forward,
                  text: "Next",
                  onTap: showNextCard,
              )
            ],)
          ],
        ),
    );

  }

  void showNextCard(){
    setState(() {
      _currentIndex = (_currentIndex + 1 < _flashcards.length) ? _currentIndex + 1 : 0;

    });

  }
  void showPreviousCard(){
    setState(() {
      _currentIndex = (_currentIndex - 1 >= 0) ? _currentIndex - 1 : _flashcards.length - 1;
    });
  }
}
