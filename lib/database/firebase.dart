import 'package:firebase_auth/firebase_auth.dart';

class FirebaseFunctions{

static Future<User?> signUpUser({required String email,required String password})async{

  try{
   final credential =    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
   return credential.user;
  }on FirebaseAuthException catch(e){
    if(e.code == "weak password"){
      print("password provided is too weak");
    }else if(e.code == "email already in use"){
      print("email already existed");
    }
  }

  catch(e){
    print(e.toString());
  }

}

  static Future<String?> login({required String email,required String password}) async{

  try{
 final response =    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
    return  response.toString();
  } on FirebaseAuthException catch(e){
    print(e.toString());
  }

  catch(e){
    print(e.toString());
  }
  }
}