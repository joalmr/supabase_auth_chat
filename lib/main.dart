import 'package:flutter/material.dart';
import 'config/shared_preference.dart';
import 'config/theme.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'manage/cubit/domain/cubit_home/home_cubit.dart';
import 'package:get/get.dart';
import 'manage/_getx/presentation/home.dart';
import 'manage/_getx/presentation/people.dart';
 
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => prefs.token.isEmpty
            ? HomeView()
            : PeopleView(),
        ),
        GetPage(
          name: 'home',
          page: () => HomeView(),
        ),
        GetPage(
          name: 'welcome',
          page: () => PeopleView(),
        ),
      ],
    );

    //* cubit
    // return MultiBlocProvider(
    //   providers: [
    //     BlocProvider(create: (_) => new HomeCubit()),
    //   ],
    //   child: MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     title: 'Chat',
    //     theme: temaClaro,
    //     home: prefs.token.isEmpty ? HomeView() : PeopleView(),
    //   ),
    // );
  }
}