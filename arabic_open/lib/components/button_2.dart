import 'package:flutter/material.dart';

class MyButton2 extends StatelessWidget {
  final String text;
  final void Function()? onTap;

  const MyButton2({super.key, required this.text, required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black, 
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(20),
        child: Center(
          child: 
            //text
            Text(
              text,
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16,),
              ),
  
        ),
      ),
    );
  }
}