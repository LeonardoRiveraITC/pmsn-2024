import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("asd",style: TextStyle(fontWeight:FontWeight.w100,fontSize: 30))
        ),
        drawer: Drawer(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
          },
          child: Icon(Icons.ads_click),
          backgroundColor: Colors.amber,
        ),
        body: Center( child: Image.network('https://c0.klipartz.com/pngpicture/224/890/gratis-png-logo-iconos-de-computadora-icono-de-hacker-de-sombrero-blanco.png')),

      )
      ,
    );
  }
}