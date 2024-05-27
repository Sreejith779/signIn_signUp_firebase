part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}

  class RegisterInitialEvent extends RegisterEvent{}

class EmailPassRegisterEvent extends RegisterEvent{

  final String email;
  final String password;

  EmailPassRegisterEvent({required this.email, required this.password});
}
