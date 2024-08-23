import 'package:arabic_open/alphabets/alphabet.dart';
import 'package:arabic_open/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Alphabet_Tile extends StatelessWidget {
  Alphabet1 alphabet1;
  Alphabet_Tile({super.key, required this.alphabet1});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      child: Container(
        margin: const EdgeInsets.all(20),
        decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.grey, width: 2)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
                alphabet1.letter,
                textAlign: TextAlign.center,
                style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                ),
              ),
          
        ],)
      ),
    );
  }
}