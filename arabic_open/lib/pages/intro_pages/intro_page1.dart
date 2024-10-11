import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('lib/images/schoolgirl_standing.png'),
            ),
            Text("Welcome to Sahlan!",
                style: GoogleFonts.dmSerifDisplay(
                    color: Colors.black,
                    fontSize: 48,
                    height: 2,
                  )),
            Text("Learn Arabic the Easy Way",
                 style: GoogleFonts.dmSerifDisplay(
                    color: Colors.black,
                    fontSize: 32,
                    height: 2,
                  )),
          ],
        ),
      ),
    );
  }
}
