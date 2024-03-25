import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pmsn2024/screens/dashboard_screen.dart';
import 'package:pmsn2024/services/email_auth_firebase.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:path_provider/path_provider.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreen createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final auth_firebase = EmailAuthFirebase();
  TextEditingController conUser = TextEditingController();
  TextEditingController conPwd = TextEditingController();
  TextEditingController conEmail = TextEditingController();

  bool isImageSelected = false;
  File? imageFile;

  _pickImagefromGallery() async {
    try {
      // getting a directory path for saving
      // final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
      // print(appDocumentsDir.path);
      // copy the file to a new path
      //final File newImage = await image.copy('$path/image1.png');
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  _pickImagefromCamera() async {
    //final Directory appDocumentsDir = await getApplicationDocumentsDirectory();
    //print(appDocumentsDir.path);
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.camera);
      if (pickedImage != null) {
        setState(() {
          imageFile = File(pickedImage.path);
          isImageSelected = true;
        });
      } else {
        print('User didnt pick any image.');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  final _validation = GlobalKey<FormState>();
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
            Positioned(
              top: 5,
              child: GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ListView(
                          children: [
                            ElevatedButton(
                                onPressed: _pickImagefromGallery,
                                child: Text("galeria")),
                            ElevatedButton(
                                onPressed: _pickImagefromCamera,
                                child: Text("camara"))
                          ],
                        );
                      });
                },
                child: Container(
                  height: 300,
                  padding: EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width * .70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(4.0)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: (imageFile == null
                            ? AssetImage('images/user.png')
                            : FileImage(imageFile!) as ImageProvider),
                      )),
                ),
              ),
            ),
            Positioned(
              top: 300,
              height: 250,
              width: 300,
              child: Opacity(
                opacity: 1,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                  child: ListView(shrinkWrap: true, children: [
                    Form(
                        key: _validation,
                        child: Column(children: [
                          TextFormField(
                            controller: conUser,
                            keyboardType: TextInputType.name,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Usuario"),
                            validator: (value) {
                              var userRegex = RegExp(r'^([A-Za-z0-9]*)$');

                              if (value == null || value.isEmpty) {
                                return 'El usuario no puede ser  vacio';
                              }
                              if (!userRegex.hasMatch(value)) {
                                return "Solo valores alfanumericos";
                              }

                              return null;
                            },
                          ),
                          TextFormField(
                            controller: conEmail,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Correo"),
                            validator: (value) {
                              var emailRegex = RegExp(
                                  r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

                              if (value == null || value.isEmpty) {
                                return 'El email no puede ser  vacio';
                              }
                              if (!emailRegex.hasMatch(value)) {
                                return 'Email incorrecto';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: conPwd,
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: "Contraseña usuario"),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'La contraseña no puede ser vacia';
                              }
                              return null;
                            },
                          ),
                        ]))
                  ]),
                ),
              ),
            ),
            Positioned(
              top: 600,
              height: 200,
              width: 300,
              child: Container(
                  child: ListView(shrinkWrap: true, children: [
                ElevatedButton(
                    onPressed: () {
                      isLoading = !isLoading;
                      setState(() {});
                      Future.delayed(new Duration(milliseconds: 1000), () {
                        if (_validation.currentState!.validate()) {
                          // If the form is valid, display a snackbar. In the real world,
                          // you'd often call a server or save the information in a database.
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Bienvenido')),
                          );
                          auth_firebase.signUpUser(name: conUser.text, password: conPwd.text, email: conEmail.text);
                        }
                      });
                    },
                    child: const Text('Registrarse'))
              ])),
            )
          ],
        ),
      ),
    );
  }
}
