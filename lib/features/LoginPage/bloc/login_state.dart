part of 'login_bloc.dart';

@immutable
 abstract class LoginState {}
 abstract class LoginActionState extends LoginState{}

  class LoginInitial extends LoginState {}

class LoginLoadedState extends LoginState{}
class HomePageNavigateActionState extends  LoginActionState{}

class LoginErrorActionState extends LoginActionState{}
