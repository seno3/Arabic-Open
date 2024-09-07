import 'package:arabic_open/components/button.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFF6EDEA),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // app name
              const SizedBox(height: 150),

              //icon
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('lib/images/sahlan_logo_scaled.png'),
              ),

              const SizedBox(height: 50),

              //title

              const Text("Learn with us!",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 28,
                    height: 2,
                  )),

              const SizedBox(height: 40),

              //subtitle

              //get started

              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      icon1: Icons.arrow_forward,
                      text: "Get Started",
                      onTap: () {
                        // go to home
                        Navigator.pushNamed(context, '/onboarding');
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: MyButton(
                      icon1: Icons.arrow_forward,
                      text: "I already have an account",
                      onTap: () {
                        // go to home
                        Navigator.pushNamed(context, '/auth');
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}