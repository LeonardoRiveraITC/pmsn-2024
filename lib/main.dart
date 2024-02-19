import 'package:flutter/material.dart';
import 'package:pmsn2024/screens/challenge.dart';
import 'package:pmsn2024/screens/dashboard_screen.dart';
import 'package:pmsn2024/screens/despensapp_screen.dart';
import 'package:pmsn2024/screens/login_screen.dart';
import 'package:pmsn2024/screens/splash_screen.dart';
import 'package:pmsn2024/settings/app_value_notifier.dart';
import 'package:pmsn2024/settings/theme.dart';
import 'package:pmsn2024/screens/challenge.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: AppValueNotifier.flagTheme,
      builder: (context,value,child) {
        return MaterialApp(
          theme: value ?  ThemeApp.lightTheme(context) : ThemeApp.darkTheme(context),
          initialRoute: '/',
          routes:{
            '/': (context) => SplashScreen(),
            '/dashboard': (context) => DashboardScreen(),
            '/login': (context) => LoginScreen(),
            '/challenge': (context) => HomePageShoes(),
            '/despensa':(context) => DespensaScreen()
          }, 
        );
      }
    );
  }
}

//void main() => runApp(MyApp());

// class MyApp extends StatefulWidget {
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int contador=0;

//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("asd",style: TextStyle(fontWeight:FontWeight.w100,fontSize: 30))
//         ),
//         drawer: Drawer(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             contador++;
//             print(contador++);
//             setState(() {});
//           },
//           child: Icon(Icons.ads_click),
//           backgroundColor: Colors.amber,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Center(
//                 child:Image.network('https://c0.klipartz.com/pngpicture/224/890/gratis-png-logo-iconos-de-computadora-icono-de-hacker-de-sombrero-blanco.png'),
//             ),
//             Text('Valor de contador $contador ')
//           ],
//         ),

//       )
//       ,
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   MyApp({super.key});
//   int contador=0;


//   @override
//   Widget build(BuildContext context){
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("asd",style: TextStyle(fontWeight:FontWeight.w100,fontSize: 30))
//         ),
//         drawer: Drawer(),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             contador++;
//             print(contador++);
//           },
//           child: Icon(Icons.ads_click),
//           backgroundColor: Colors.amber,
//         ),
//         body: Center( child: Column(
//           children: [
//             Image.network('https://c0.klipartz.com/pngpicture/224/890/gratis-png-logo-iconos-de-computadora-icono-de-hacker-de-sombrero-blanco.png'),
//             Text('Valor de contador $contador ')
//           ],
//         )),

//       )
//       ,
//     );
//   }
// }