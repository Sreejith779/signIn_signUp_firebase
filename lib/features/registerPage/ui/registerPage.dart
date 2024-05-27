import 'package:firebase_test2/features/LoginPage/ui/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/register_bloc.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  RegisterBloc registerBloc = RegisterBloc();

  @override
  void initState() {
  registerBloc.add(RegisterInitialEvent());
    super.initState();

  }

  @override
  void dispose() {
 emailController.dispose();
 passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      bloc: registerBloc,
      listenWhen: (previous,current)=> (current is RegisterActionState),
      buildWhen: (previous,current)=> (current is! RegisterActionState),
      listener: (context, state) {
        if (state is LoginNavigateActionState) {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>
     LoginPage()));
     print("sucess");
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Something went wrong.Please try again")));
        }

      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("Register"),
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
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(18)
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: passController,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(),
                          borderRadius: BorderRadius.circular(18)
                      )
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(onPressed: ()  {
                  final email = emailController.text.trim();
                  final password = passController.text.trim();
  registerBloc.add(EmailPassRegisterEvent(email: email, password: password));
                },
                    child: Text("Register")),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("have an account?"),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (
                            context) =>
                        const LoginPage()));
                      },
                      child: const Text("Login", style: TextStyle(
                          color: Colors.deepPurple,
                          fontWeight: FontWeight.w600
                      ),),
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
