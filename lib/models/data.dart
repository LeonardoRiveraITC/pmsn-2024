import 'package:flutter/material.dart';
import 'package:pmsn2024/models/shoes.dart';

final listCategory = ['Haacking','Books'];

final listShoes = [
  Shoes(
    'Hacking the art of exploitation',
    'John Ericson',
    '\$120.00',
    4,
    [
      ImageShoes(
        'images/artoe.png',
        const Color(0xffEAA906),
        '''
        La segunda ediciòn de un clàsico de la 
        ciberseguridad en su segunda ediciòn. 
        (La imagen de debian incluida en este libro,
        no se incluye, y en su lugar se proporciona 
        un enlace de descarga)'''
      ),
    ],
  ),
  Shoes(
    'Flipper Zero',
    'ZER 0',
    '\$150.00',
    3,
    [
      ImageShoes(
        'images/flipper.png',
        const Color(0xff08B894),
        "Flipper zero rev1.0. (Sin existencias hasta nuevo aviso)"
      ),
    ],
  ),
  Shoes(
    'Ruber Ducky',
    'HACK 5',
    '\$180.00',
    4,
    [
      ImageShoes(
        'images/rubber_ducky.jpg',
        const Color(0xff7B7A41),
        "Rubber ducky de HACK5"
      ),
    ],
  ),
];