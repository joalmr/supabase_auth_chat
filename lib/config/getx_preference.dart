import 'package:get_storage/get_storage.dart';

class PreferenciasUsuario {
  GetStorage box = GetStorage();

  get userId => box.read('userId') ?? '';
  set userId(String value) => box.write('userId', value);
  userIdHas() => box.hasData('userId');
  userIdDel() => box.remove('userId');

  //token app
  get token => box.read('token') ?? '';
  set token(String value) => box.write('token', value);
  tokenHas() => box.hasData('token');
  tokenDel() => box.remove('token');
}

// final prefs = new PreferenciasUsuario();