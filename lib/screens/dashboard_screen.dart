import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Dashboard')),
      drawer:Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(backgroundImage: NetworkImage('https://i.pravatar.cc/150')),
              accountName: Text("data"),
              accountEmail: Text("data")
              ),
              ListTile(leading:Icon(Icons.phone),
              title: Text('Practica'),
              subtitle: Text('subtite'),
              trailing: Icon(Icons.chevron_right),
              ),
              ListTile(leading:Icon(Icons.close),
              title: Text('Salir'),
              subtitle: Text('Hasta luego'),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);},
              ),              
          ],
        ),
      )
    );
  }
}