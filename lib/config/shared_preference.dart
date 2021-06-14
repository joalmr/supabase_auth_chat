import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {

  static final UserPreferences _instancia = new UserPreferences._internal();

  factory UserPreferences() => _instancia;

  UserPreferences._internal();
  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  String get userId => _prefs.getString('userId') ?? '';
  set userId(String value ) => _prefs.setString('userId', value);
  userIdDel() => _prefs.remove('userId');

  //token app
  String get token => _prefs.getString('token') ?? '';
  set token(String value) => _prefs.setString('token', value);
  tokenDel() => _prefs.remove('token');
}

final prefs = new UserPreferences();