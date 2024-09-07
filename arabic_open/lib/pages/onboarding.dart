import 'package:arabic_open/pages/intro_pages/intro_page1.dart';
import 'package:arabic_open/pages/intro_pages/intro_page2.dart';
import 'package:arabic_open/pages/intro_pages/intro_page3.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  PageController _controller = PageController();
  bool onLastPage = false;
  bool onFirstPage = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(

        children:  [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState((){
                onLastPage = (index == 2);
                onFirstPage = (index != 0);
              });


            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
        ),

        Container(
          alignment: Alignment(0, 0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              onFirstPage ?
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/welcome');
                },
                child: Text('back'),

              )
              :GestureDetector(
                onTap:() {
                  _controller.previousPage(duration:
                   Duration(milliseconds: 500), 
                   curve: Curves.easeIn);

                },
                child: Text('back'),
              ),
              SmoothPageIndicator(controller: _controller, count: 3),

              onLastPage ?
              GestureDetector(
                onTap: (){
                   Navigator.pushNamed(context, '/courses');
                },
                child: Text('done'),

              )
              : GestureDetector(
                onTap:() {
                  _controller.nextPage(duration:
                   Duration(milliseconds: 500), 
                   curve: Curves.easeIn);

                },
                child: Text('next'),
              )
            ],
          )
          ),
        ],
        
        
        
      )

    );
  }
}