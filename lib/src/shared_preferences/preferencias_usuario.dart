
import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario{

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  PreferenciasUsuario._internal();
  SharedPreferences _prefs;

  factory PreferenciasUsuario(){
    return _instancia;
  }



  initPrefs()async{
    this._prefs = await SharedPreferences.getInstance();
  }

  get genero {
    return _prefs.getInt('genero') ?? 1 ;
  }
  set genero (int value){
    _prefs.setInt('genero', value);
  }

  get colorSecundario {
    return _prefs.getBool('color') ?? false ;
  }
  set colorSecundario (bool value){
    _prefs.setBool('color', value);
  }
  get nombre {
    return _prefs.getString('nombre') ?? '' ;
  }
  set nombre (String value){
    _prefs.setString('nombre', value);
  }
  get lastPage {
    return _prefs.getString('lastPage') ?? 'home' ;
  }
  set lastPage (String value){
    _prefs.setString('lastPage', value);
  }




}