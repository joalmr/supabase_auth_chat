import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/domain/getx/homeController.dart';

class HomeView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_){
        return Scaffold(
          appBar: AppBar(title: Text('Sign In'),),
          body: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.black,
                  labelStyle: TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
                  tabs: [
                    Tab(text: "Login"),
                    Tab(text: "Registrarse"),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Login',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              onChanged: (val) => _.email.value = val,
                              decoration: InputDecoration(
                                labelText: 'Email'
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              onChanged: (val) => _.password.value = val,
                              decoration: InputDecoration(
                                labelText: 'Contraseña'
                              ),
                            ),
                            SizedBox(height: 5),
                            TextButton(onPressed: _.login, child: Text('Ingresar'))
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Registrarse',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              onChanged: (val) => _.regEmail.value = val,
                              decoration: InputDecoration(
                                labelText: 'Email'
                              ),
                            ),
                            SizedBox(height: 5),
                            TextFormField(
                              onChanged: (val) => _.regPassword.value = val,
                              decoration: InputDecoration(
                                labelText: 'Contraseña'
                              ),
                            ),
                            SizedBox(height: 5),
                            TextButton(onPressed: _.register, child: Text('Registrarme'))
                          ],
                        ),
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