import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config/shared_preference.dart';
import 'config/theme.dart';
import 'presentation/getx/home.dart';
import 'presentation/getx/people.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await GetStorage.init();
  await prefs.initPrefs();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //* getx
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chat',
      themeMode: ThemeMode.light,
      theme: temaClaro,
      home: prefs.token.isEmpty ? HomeView() : PeopleView(),
    );
  }
}