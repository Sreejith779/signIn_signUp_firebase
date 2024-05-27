part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}
abstract class RegisterActionState extends RegisterState{}

  class RegisterInitial extends RegisterState {}
  class RegisterLoadedState extends RegisterState {}
class LoginNavigateActionState extends RegisterActionState{}
class RegisterErrorActionState extends RegisterActionState{}


