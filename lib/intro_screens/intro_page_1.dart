import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
        color: Colors.lightGreen,
        child: ListView(
          children: [
            FlipCard(
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              side: CardSide.FRONT, // The side to initially display.
              front: Container(
                child: Lottie.network(
                "https://lottie.host/3906c28d-66e6-4a9c-b5fe-42b615cb9831/JCOQdxTTJ8.json"),
              ),
              back: Container(
                alignment:Alignment.center,
                child: Text(
                  style:TextStyle(fontSize: 20,color: Colors.black),
                  'El instituto tecnològico de celaya es la mayor casa de estudios y es lider en la educaciòn de profesionales a nivel internacional'),
              ),
            )
          ],
        ));
  }
}