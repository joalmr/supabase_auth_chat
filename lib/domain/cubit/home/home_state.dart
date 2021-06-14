part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeSignUp extends HomeState {
  final String mensaje;
  HomeSignUp({this.mensaje});
}
class HomeSignIn extends HomeState {
  final bool valor;
  HomeSignIn({this.valor});
}
