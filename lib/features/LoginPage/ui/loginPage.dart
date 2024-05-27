import 'package:firebase_test2/features/homePage/ui/homePage.dart';
import 'package:firebase_test2/features/registerPage/ui/registerPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  LoginBloc loginBloc = LoginBloc();


  @override
  void dispose() {
 emailController.dispose();
 passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      bloc: loginBloc,
      listenWhen: (previous,current)=>(current is LoginActionState),
       buildWhen: (previous,current)=>(current is! LoginActionState),
      listener: (context, state) {
         if(state is HomePageNavigateActionState){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>
           HomePage()));
         }else if(state is LoginErrorActionState){
           ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Failed")));
         }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          body: Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Email",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(18))),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderSide: BorderSide(),
                          borderRadius: BorderRadius.circular(18))),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      final email = emailController.text.trim();
                      final password = passController.text.trim();
                      loginBloc.add(LoginInitialEvent(email, password));

                    },
                    child: const Text("Login")),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("don't have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const RegisterPage()));
                      },
                      child: const Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
