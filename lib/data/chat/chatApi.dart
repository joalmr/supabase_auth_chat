import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/config/shared_preference.dart';
import 'package:supabase_flutter/data/model/messageModel.dart';
import 'package:supabase_flutter/data/model/userModel.dart';

import '../../settings/env.dart';

class ChatApi{
  final supabaseClient = SupabaseClient(url, key);

  Future<List<UserModel>> getUsers() async {
    List<UserModel> usuarios = [];

    final users = await supabaseClient
      .from('users')
      .select()
      .execute();

    if(users.data!=null){
      final userList = users.data as List;
      usuarios = userList.map((e) => UserModel.fromJson(e)).toList();
    }

    return usuarios;
  }

  Future<List<MessageModel>> getMessages() async {
    List<MessageModel> mensajes = [];
    
    final allMessages = await supabaseClient
      .from('message')
      .select('''
        *,
        users(*)
      ''')
      .execute();

    print(allMessages.status);
    if(allMessages.error!=null)
      print(allMessages.error.message);

    if(allMessages.data!=null){
      final messageList = allMessages.data as List;
      mensajes = messageList.map((e) => MessageModel.fromJson(e)).toList();
    }

    return mensajes;
  }

  Future<void> insertMessage(String message) async {
    final sendMessage = await supabaseClient
      .from('message')
      .insert([
        {
          'canal_id': 6,
          'user_id': prefs.userId,
          'message': message,
        }
      ])
      .execute();
    
    print(sendMessage.status);
    if(sendMessage.error!=null)
      print(sendMessage.error.message);
  }
}
