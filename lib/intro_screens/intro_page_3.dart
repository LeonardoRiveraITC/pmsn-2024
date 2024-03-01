import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
        color: Colors.amber,
        child: ListView(
          children: [
            FlipCard(
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              side: CardSide.FRONT, // The side to initially display.
              front: Container(
                child:             Lottie.network(
                "https://lottie.host/ffda6e65-2e96-496b-ad5f-78d269f88b2e/4ecLToY78T.json"),
              ),
              back: Container(
                alignment:Alignment.center,
                child: Text(
                  style:TextStyle(fontSize: 20,color: Colors.black),
                  'test'),
              ),
            )
          ],
        ));
  }
}