import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2024/screens/challenge.dart';
import 'package:pmsn2024/screens/dashboard_screen.dart';
import 'package:pmsn2024/screens/despensapp_screen.dart';
import 'package:pmsn2024/screens/detail_movie_screen.dart';
import 'package:pmsn2024/screens/login_screen.dart';
import 'package:pmsn2024/screens/popular_movies_screen.dart';
import 'package:pmsn2024/screens/practica_t_screen.dart';
import 'package:pmsn2024/screens/products_firebase_screen.dart';
import 'package:pmsn2024/screens/register.dart';
import 'package:pmsn2024/screens/splash_screen.dart';
import 'package:pmsn2024/settings/app_value_notifier.dart';
import 'package:pmsn2024/settings/theme.dart';
import 'package:pmsn2024/screens/challenge.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async{
WidgetsFlutterBinding.ensureInitialized(); 
await Firebase.initializeApp(
  options: const FirebaseOptions(
      apiKey:
          "AIzaSyC2fHhD0Tu6Cc-RXmlcIIVS3lvUYRdAbjE", // paste your api key here
      appId:
          "com.andb.pmsn2024", //paste your app id here
      messagingSenderId: "240406044412", //paste your messagingSenderId here
      projectId: "test-467c5", //paste your project id here
    ),
);
runApp(MyApp());
}

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
            '/despensa':(context) => DespensaScreen(),
            '/register':(context) => RegisterScreen(),
            '/prac3':(context) => practicaTScreen(),
            "/movies":(context) => popularMoviesScreen(),
            "/detail":(context) => DetailMovieScreen(),
            "/fbScreen":(context) => ProductsFirebaseScreen()

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