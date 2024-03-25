import 'package:flutter/material.dart';
import 'package:pmsn2024/screens/dashboard_screen.dart';
import 'package:pmsn2024/services/email_auth_firebase.dart';
import 'package:sign_in_button/sign_in_button.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  final auth_firebase = EmailAuthFirebase();

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/fondo.jpg'), fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.center * 0.9,
          children: [
            isLoading
                ? Positioned(
                    top: 50,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                : Container(),
            Image.asset('images/htb.png'),
            Positioned(
              top: 300,
              height: 200,
              width: 300,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.blueAccent,
                ),
                child: ListView(shrinkWrap: true, children: [
                  TextFormField(
                    controller: conUser,
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    controller: conPwd,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration:
                        const InputDecoration(border: OutlineInputBorder()),
                  )
                ]),
              ),
            ),
            Positioned(
              top: 600,
              height: 200,
              width: 300,
              child: Container(
                  child: ListView(shrinkWrap: true, children: [
                SignInButton(Buttons.email, onPressed: () {
                  isLoading = !isLoading;
                  setState(() {});
                  Future.delayed(new Duration(milliseconds: 1000), () {
                 //   auth_firebase.signInUser(password: conPwd.text, email: conUser.text).then((value) {
                    //if(value){
                    Navigator.pushNamed(context, "/dashboard").then((value) {
                      setState(() {
                        isLoading = false;
                      });
                    });
                    //  }
                 //   });

                    //Navigator.push(context, MaterialPageRoute(builder:(context) => new DashboardScreen()));
                  });
                }),
                SignInButton(Buttons.google, onPressed: () {})
              ])),
            )
          ],
        ),
      ),
    );
  }
}
