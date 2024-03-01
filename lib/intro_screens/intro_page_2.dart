import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
   return Container(
        color: Colors.white,
        child: ListView(
          children: [
            FlipCard(
              fill: Fill
                  .fillBack, // Fill the back side of the card to make in the same size as the front.
              direction: FlipDirection.HORIZONTAL, // default
              side: CardSide.FRONT, // The side to initially display.
              front: Container(
                child: Lottie.network(
                "https://lottie.host/f8e264fe-692d-421c-b019-bc6781c6465f/csaYLOo4Vl.json"),
              ),
              back: Container(
                alignment:Alignment.center,
                child: Text(
                  style:TextStyle(fontSize: 20,color: Colors.black),
                  'La ingenieria en sistemas computacionales es una de las carreras pilares del futuro, que nos permite hacer implementaciones pràcticas de distintas tecnologìas y soluciones'),
              ),
            )
          ],
        ));
  }
}