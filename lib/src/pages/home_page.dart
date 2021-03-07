import 'package:flutter/material.dart';
import 'package:preferences_flutter/src/pages/settings_page.dart';
import 'package:preferences_flutter/src/pages/widgets/menu_lateral_widget.dart';
import 'package:preferences_flutter/src/shared_preferences/preferencias_usuario.dart';

class HomePage extends StatelessWidget {
  
  static final String routeName = 'home';
  final prefs = new PreferenciasUsuario();
  

  
  @override
  Widget build(BuildContext context) {

    
    prefs.lastPage = HomePage.routeName;

    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias del usuario"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),
      drawer: MenuLateralWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Color secundario: ${prefs.colorSecundario}"),
          Divider(),
          Text("Genero: ${prefs.genero}"),
          Divider(),
          Text("Nombre usuario: ${prefs.nombre}"),
          Divider(),
        ],
      ),
    );
  }
}