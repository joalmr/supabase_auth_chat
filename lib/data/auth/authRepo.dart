import 'authApi.dart';

class AuthRepo{
  final _api = AuthApi();

  signUp(String email, String password) {
    return _api.signUp(email, password);
  }

  signIn(String email, String password) {
    return _api.signIn(email, password);
  }

  signOut() {
    return _api.signOut();
  }
}