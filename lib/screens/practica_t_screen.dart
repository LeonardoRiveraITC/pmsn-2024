import 'package:flutter/material.dart';
import 'package:pmsn2024/intro_screens/intro_page_1.dart';
import 'package:pmsn2024/intro_screens/intro_page_2.dart';
import 'package:pmsn2024/intro_screens/intro_page_3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class practicaTScreen extends StatefulWidget {
  const practicaTScreen({Key? key}) : super(key: key);

  @override
  State<practicaTScreen> createState() => _practicaTScreenState();
}

class _practicaTScreenState extends State<practicaTScreen> {
  PageController _controller=PageController();
  bool onLastPage=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _controller,
          onPageChanged: (index){
            setState(() {
              onLastPage=(index==2);
            });
          },
          children: [
            IntroPage1(),
            IntroPage2(),
            IntroPage3(),
          ],
        ),
        Container(alignment: Alignment(0,0.75),child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              onTap: () {
                _controller.jumpToPage(2);
              },
              child: Text("skip")),

            SmoothPageIndicator(controller: _controller, count: 3),

            onLastPage ? GestureDetector(
              onTap: () {
                _controller.nextPage(duration: Duration(milliseconds:500), curve: Curves.easeIn);
              },
              child: Text("Fin")) 
              : GestureDetector(
              onTap: () {
                _controller.nextPage(duration: Duration(milliseconds:500), curve: Curves.easeIn);
              },
              child: Text("Next"))
          ],
        ))
      ],
    ));
  }
}
