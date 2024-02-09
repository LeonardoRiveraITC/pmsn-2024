import 'package:flutter/material.dart';
import 'package:pmsn2024/screens/dashboard_screen.dart';
import 'package:sign_in_button/sign_in_button.dart';


class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final txtUser= TextFormField(
    keyboardType: TextInputType.emailAddress,
    decoration: const InputDecoration(border: OutlineInputBorder()),
  );
  final pwdUser=TextFormField(
    keyboardType:TextInputType.text,
    obscureText: true,
    decoration: const InputDecoration(border: OutlineInputBorder()),
  );

  bool isLoading=false; 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage('images/fondo.jpg'),fit: BoxFit.cover)
        ),
        child: Stack(
          alignment: Alignment.center*0.9,
          children: [
             isLoading? Positioned(
              top:200,
              child: CircularProgressIndicator(color: Colors.white,) ):Container(),
            Image.asset('images/htb.png'),
            Positioned(
              top: 600,
              height: 200,
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.blueAccent,
                ),
                child: ListView(
                shrinkWrap: true,
                children: [
                  txtUser,
                  SizedBox(height: 10),
                  pwdUser
                ]),
              ),
            ),
            Positioned(
              top: 900,
              height: 200,
              width: 300,
              child: Container(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    SignInButton(Buttons.email, onPressed: (){
                    isLoading= !isLoading;
                    setState(() {});
                    Future.delayed(new Duration(milliseconds: 5000),
                    (){
                      Navigator.push(context, MaterialPageRoute(builder:(context) => new DashboardScreen()));
                    }
                    );
                    }),
                    SignInButton(Buttons.google, onPressed: (){})])),
            )],
        ),
      ),
    );
  }
}