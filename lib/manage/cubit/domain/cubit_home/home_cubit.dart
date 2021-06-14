import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/data/auth/authRepo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  final _repo = AuthRepo();

  signIn(String email, String password) async {
    final response = await _repo.signIn(email, password);
    emit(HomeSignIn(valor: response));
  }

  signUp(String email, String password) async {
    final response = await _repo.signUp(email, password);
    if(response){
      emit(HomeSignUp(mensaje: 'Valida tu correo, revisa tu bandeja'));
    }
    else{
      emit(HomeSignUp(mensaje: 'No se pudo registrar'));
    }
    
  }
}
