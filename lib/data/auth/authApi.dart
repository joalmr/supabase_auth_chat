import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/config/shared_preference.dart';

import '../../settings/env.dart';

class AuthApi{
  final supabaseClient = SupabaseClient(url, key);

  Future<bool> signUp(String email, String password) async {
    bool retorna = false;
    final response = await supabaseClient.auth.signUp(email, password);

    if(response.error!=null)
      print(response.error.message);
    
    else
      retorna=true;
    
    return retorna;
  }

  
  Future<bool> signIn(String email, String password) async {
    final response = await supabaseClient.auth.signIn(email: email, password: password);

    bool retorna = false;
    if (response.error != null) {
      print(response.error.message);
    } else {
      final User user = response.user;
      final Session session = response.data;

      prefs.userId = user.id;
      prefs.token = session.refreshToken;

      retorna = true;
    }
    return retorna;
  }

  Future<void> signOut() async {
    await supabaseClient.auth.signOut();

    prefs.userIdDel();
    prefs.tokenDel();
  }

}