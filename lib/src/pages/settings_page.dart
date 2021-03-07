import 'package:flutter/material.dart';
import 'package:preferences_flutter/src/pages/widgets/menu_lateral_widget.dart';
import 'package:preferences_flutter/src/shared_preferences/preferencias_usuario.dart';

class SettingsPage extends StatefulWidget {
  
  static final String routeName = 'settings';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  bool _colorSecundario;
  int _genero;
  String _nombre;

  TextEditingController _textController ;
  final prefs = new PreferenciasUsuario();

  @override
  void initState() {
    super.initState();
    _genero = prefs.genero;
    _colorSecundario = prefs.colorSecundario;
    _nombre = prefs.nombre;
    prefs.lastPage = SettingsPage.routeName;
    _textController = new TextEditingController(text: _nombre);
  }
  
  _setSelectedRadio(int valor){
    prefs.genero = valor;
      _genero = valor;      
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ajustes"),
        backgroundColor: (prefs.colorSecundario) ? Colors.teal : Colors.blue,
      ),

      drawer: MenuLateralWidget(),
      body: ListView(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5),
            child: Text('Ajustes',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
          ),
          Divider(),

          SwitchListTile(
            value: _colorSecundario,
            title: Text('Color Secundario'),
            onChanged:(value){
              setState(() {
                _colorSecundario = value;
                prefs.colorSecundario = value;
              });
            },
          ),
          RadioListTile(
            value: 1,
            title: Text('Hombre'), 
            groupValue: _genero, 
            onChanged: (value){
              _setSelectedRadio(value);
            }
          ),
          RadioListTile(
            value: 2,
            title: Text('Mujer'), 
            groupValue: _genero, 
            onChanged: (value){
              _setSelectedRadio(value);
            }
            ),
            Divider(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 60),
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  helperText: 'Introduce tu nombre'
                ),
                onChanged: (value){
                  setState(() {
                    _nombre = value;
                    prefs.nombre = value;
                  });
                },
              ),
            )
            
        ],
      ),
    );
  }

  
}