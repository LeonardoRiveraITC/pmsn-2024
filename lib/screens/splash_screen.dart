import 'package:flutter/material.dart';
import 'package:pmsn2024/screens/login_screen.dart';
import 'package:splash_view/splash_view.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashView(
      backgroundColor: Colors.blueGrey,
      logo: Image.network('https://pngimg.es/d/hacker_PNG16.png',height: 250),
      loadingIndicator: Image.asset('images/cat-orange-cat.gif'),
      done:Done(LoginScreen(),animationDuration: const Duration(milliseconds: 3000)),
    );
  }
}
