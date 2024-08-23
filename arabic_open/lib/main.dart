import 'package:arabic_open/pages/coursescreen.dart';
import 'package:arabic_open/pages/flashcards.dart';
import 'package:arabic_open/pages/home.dart';
import 'package:arabic_open/pages/onboarding.dart';
import 'package:arabic_open/pages/quizzes.dart';
import 'package:arabic_open/pages/unitpage.dart';
import 'package:arabic_open/pages/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of our application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Poppins'),
      home: const Welcome(),
      routes: {
        '/onboarding': (context) => const OnBoardingScreen(),
        '/courses': (context) => const CourseScreen(),
        '/units': (context) => const UnitPage(),
        '/home': (context) => const HomePage(),
        '/welcome': (context) => const Welcome(),
        '/quizzes': (context) => const QuizPage(),
        '/flashcards': (context) => const FlashCardPage(),

      },
    );
  }
}

