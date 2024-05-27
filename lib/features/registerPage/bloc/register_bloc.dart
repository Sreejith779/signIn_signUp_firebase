import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_test2/database/firebase.dart';
import 'package:meta/meta.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterInitialEvent>(registerInitialEvent);
    on<EmailPassRegisterEvent>(emailPassRegisterEvent);
  }

  FutureOr<void> registerInitialEvent(
      RegisterInitialEvent event, Emitter<RegisterState> emit) {
    emit(RegisterLoadedState());
  }

  FutureOr<void> emailPassRegisterEvent(
      EmailPassRegisterEvent event, Emitter<RegisterState> emit) async {

    final user = await FirebaseFunctions.signUpUser(email: event.email, password: event.password);
    if(user!=null){
      emit(LoginNavigateActionState());
    }else{
      emit(RegisterErrorActionState());
    }

  }
}
