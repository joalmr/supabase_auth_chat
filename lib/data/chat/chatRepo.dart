import 'chatApi.dart';

class ChatRepo{
  final _api = ChatApi();

  getUsers(){
    return _api.getUsers();
  }

  getMessages(){
    return _api.getMessages();
  }

  insertMessage(String message){
    return _api.insertMessage(message);
  }
}