import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/config/shared_preference.dart';
import 'package:supabase_flutter/manage/getx/domain/chatController.dart';

class PeopleView extends StatelessWidget {
  final mensaje = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetX<ChatController>(
      init: ChatController(),
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text('Bienvenido'),),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(text: "Contactos"),
                    Tab(text: "Chat"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        child: ListView.builder(
                          itemCount: _.users.length,
                          itemBuilder: (BuildContext context, int index) {
                            final user = _.users[index];
                            return ListTile(
                              leading: CircleAvatar(backgroundImage: AssetImage('assets/images/user.png'),),
                              title: Text(user.username.split('@')[0]),
                            );
                          },
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              child: ListView.builder(
                                itemCount: _.messages.length,
                                itemBuilder: (BuildContext context, int index) {
                                  final message = _.messages[index];
                                  return Container(
                                    margin: message.userId == prefs.userId
                                      ? EdgeInsets.only(left: 45,top: 5, bottom: 5, right: 5)
                                      : EdgeInsets.only(right: 45,top: 5, bottom: 5, left: 5),
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: message.userId == prefs.userId
                                        ? BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomLeft: Radius.circular(25))
                                        : BorderRadius.only(topLeft: Radius.circular(25), topRight: Radius.circular(25), bottomRight: Radius.circular(25)),
                                      color: message.userId == prefs.userId ? Colors.green.withOpacity(0.5) : Colors.blue.withOpacity(0.5)
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 5),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          message.userId != prefs.userId 
                                          ? Text(
                                            '${message.user.username.split('@')[0]}:',
                                            style: TextStyle(
                                              fontSize: 8
                                            ),
                                          )
                                          : SizedBox(height: 0),
                                          Text(message.message),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: double.maxFinite,
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(
                                controller: mensaje,
                                decoration: InputDecoration(
                                  suffix: TextButton(
                                    onPressed: (){
                                      if(mensaje.text.trim()!=''){
                                        _.insertMessage(mensaje.text);
                                        mensaje.text = '';
                                      }
                                    }, 
                                    child: Text('Enviar'),
                                  )
                                ),
                              ),
                            ),
                          ],
                        )
                      ),
                    ],
                  ),
                ),
                
              ],
            ),
          ),
          
        );
      },
    );
    
  }
}