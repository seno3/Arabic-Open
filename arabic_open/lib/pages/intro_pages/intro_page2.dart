import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image.asset('lib/images/schoolgirl_standing_2.png'),
            ),
            Text("We have",
                style: GoogleFonts.dmSerifDisplay(
                  color: Colors.black,
                  fontSize: 48,
                  height: 2,
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.question_mark_sharp, color: Colors.black),
                const SizedBox(width: 20),
                Text('Quizzes',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 24,
                      height: 2,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.quiz, color: Colors.black),
                const SizedBox(width: 20),
                Text('Flashcards',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 24,
                      height: 2,
                    )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.computer_rounded, color: Colors.black),
                const SizedBox(width: 20),
                Text('AI Chatbot',
                    style: GoogleFonts.dmSerifDisplay(
                      color: Colors.black,
                      fontSize: 24,
                      height: 2,
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
