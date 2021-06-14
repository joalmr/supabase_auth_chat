import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/data/auth/authRepo.dart';
import 'package:supabase_flutter/manage/getx/presentation/people.dart';

class HomeController extends GetxController {
  final _repo = AuthRepo();

  RxString email = ''.obs;
  RxString password = ''.obs;

  RxString regEmail = ''.obs;
  RxString regPassword = ''.obs;

  @override
  void onInit() {
    super.onInit();
  }

  register() => _register();

  _register() async {
    final response = await _repo.signUp(regEmail.value, regPassword.value);
    if(response){
      Get.dialog(AlertDialog(title: Text('Valida tu correo, revisa tu bandeja'),));
    }
    else{
      Get.dialog(AlertDialog(title: Text('No se pudo registrar'),));
    }
    
  }

  login() => _login();

  _login() async {
    final response = await _repo.signIn(email.value, password.value);
    if(response){
      Get.off(PeopleView());
    }
    else{
      Get.dialog(AlertDialog(title: Text('No se pudo ingresar'),));
    }
  }

}