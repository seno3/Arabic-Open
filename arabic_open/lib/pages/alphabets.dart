import 'package:arabic_open/alphabets/alphabet.dart';
import 'package:arabic_open/components/alphabet_tile.dart';
import 'package:flutter/material.dart';

class AlphabetsPage extends StatelessWidget {
  const AlphabetsPage({super.key});

  @override
  Widget build(BuildContext context) {
    List alphabetlist = [
      'أ',
      'ب',
      'ت',
      'ث',
      "ج",
      "ح",
      "خ",
      "د",
      "ذ",
      "ر",
      "ز",
      "س",
      "ش",
      "ص",
      "َض",
      "ط",
      "ظ",
      "ع",
      "غ",
      "ف",
      "ق",
      "ك",
      "ل",
      "م",
      "ن",
      "ه",
      "و",
      "ي"
    ];
    return Scaffold(
        
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Column(children: [
                //alphabet
                 Text(
                    "Let's Learn Arabic!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  Text(
                    "Get to know the Arabic writing system",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
              

                //description

                //pronunciation
              ]),
            ),
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(5),
                scrollDirection: Axis.vertical,
                itemCount: alphabetlist.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: (context, index) {
                  Alphabet1 alphabet1 = Alphabet1(letter: alphabetlist[index]);
                  return Alphabet_Tile(alphabet1: alphabet1);
                },
              ),
            )
          ],
        ));
  }
}
