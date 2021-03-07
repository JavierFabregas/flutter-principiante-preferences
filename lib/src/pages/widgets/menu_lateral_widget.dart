import 'package:flutter/material.dart';
import 'package:preferences_flutter/src/pages/home_page.dart';
import 'package:preferences_flutter/src/pages/settings_page.dart';

class MenuLateralWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage('assets/menuLateral.jpg'),fit: BoxFit.cover),
            ),
            child: Container(

            ),
          ),

          ListTile(
            leading: Icon(Icons.pages,color: Colors.blue),
            title: Text('Pages'),
            onTap: () {
               Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(Icons.party_mode,color: Colors.blue),
            title: Text('Party mode'),
            onTap: (){},
          ),
          ListTile(
            leading: Icon(Icons.settings,color: Colors.blue),
            title: Text('Ajustes'),
            onTap: () {
               Navigator.pop(context);      
               Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      )
    );
  }
}