import 'package:day_night_switch/day_night_switch.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2024/settings/app_value_notifier.dart';

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
              onTap: (){
                Navigator.pushNamed(context, '/challenge');
              },
              ),
              ListTile(leading:Icon(Icons.close),
              title: Text('Salir'),
              subtitle: Text('Hasta luego'),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pop(context);
                Navigator.pop(context);},
              ),
            ListTile(leading:Icon(Icons.phone),
              title: Text('Mi despensa'),
              subtitle: Text('despensa'),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pushNamed(context, '/despensa');
              },
              ),
            ListTile(leading:Icon(Icons.phone),
              title: Text('Registro'),
              subtitle: Text('Registro'),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pushNamed(context, '/register');
              },
              ),    
            ListTile(leading:Icon(Icons.phone),
              title: Text('Practica 3'),
              subtitle: Text('Practica 3'),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pushNamed(context, '/prac3');
              },
              ),
            ListTile(leading:Icon(Icons.phone),
              title: Text('PEliculas'),
              subtitle: Text('PEliculas'),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pushNamed(context, '/movies');
              },
              ), 
            ListTile(leading:Icon(Icons.phone),
              title: Text('fireb'),
              subtitle: Text('fireb'),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.pushNamed(context, '/fbScreen');
              },
              ),                                                                      
              DayNightSwitch(
                value: AppValueNotifier.flagTheme.value, 
                onChanged: 
                (value){
                 AppValueNotifier.flagTheme.value=value;
                })              
          ],
        ),
      )
    );
  }
}