import 'package:arabic_open/firebase_options.dart';
import 'package:arabic_open/pages/courses_video.dart';
import 'package:arabic_open/pages/coursescreen.dart';
import 'package:arabic_open/pages/flashcards.dart';
import 'package:arabic_open/pages/quiz.dart';
import 'package:arabic_open/pages/home.dart';
import 'package:arabic_open/pages/onboarding.dart';
import 'package:arabic_open/pages/unitpage.dart';
import 'package:arabic_open/pages/welcome.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        '/units': (context) => UnitPage(),
        '/home': (context) => const HomePage(),
        '/welcome': (context) => const Welcome(),
        '/flashcards': (context) => const FlashCardPage(),
        '/video': (context) => const CourseVideo(),
        '/quiz': (context) => QuizPage(),
      },
    );
  }
}

