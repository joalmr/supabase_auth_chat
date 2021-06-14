import 'package:get/get.dart';
import 'package:supabase/supabase.dart';
import 'package:supabase_flutter/data/auth/authRepo.dart';
import 'package:supabase_flutter/data/model/canalModel.dart';
import 'package:supabase_flutter/data/model/messageModel.dart';
import 'package:supabase_flutter/data/model/userModel.dart';
import 'package:supabase_flutter/settings/env.dart';
import 'package:supabase_flutter/data/chat/chatRepo.dart';

class ChatController extends GetxController {
  final _repo = ChatRepo();
  final _auth = AuthRepo();

  RxList<UserModel> users = <UserModel>[].obs;
  RxList<CanalModel> chats = <CanalModel>[].obs;
  RxList<MessageModel> messages = <MessageModel>[].obs;

  final supabaseClient = SupabaseClient(url, key);

  RealtimeSubscription subscription;
  
  @override
  void onInit() {
    super.onInit();
    getAllUsers();
    
    getMessages();
    subscribe();
  }

  @override
  void onClose() {
    super.onClose();
    supabaseClient.removeSubscription(subscription);
  }

  logout() => _logout();
  _logout() async {
    print('logout');
    await _auth.signOut();
    Get.offAllNamed('home');
  }

  getAllUsers() => _getAllUsers();
  _getAllUsers() async {
    final response = await _repo.getUsers();
    users.clear();
    users.addAll(response);
  }

  insertMessage(String mensaje) => _insertMessage(mensaje);
  _insertMessage(String mensaje) async {
    await _repo.insertMessage(mensaje);
  }

  getMessages() => _getMessages();
  _getMessages() async {
    final response = await _repo.getMessages();
    messages.clear();
    messages.addAll(response);
  }

  subscribe(){
    subscription = supabaseClient
      .from('message')
      .on(
        SupabaseEventTypes.all, 
        (payload) => {
          getMessages()
      }).subscribe();

    // return supabaseClient.removeSubscription(subscription);
  }

  

  
  
}