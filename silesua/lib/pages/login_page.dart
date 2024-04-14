import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:silesua/components/my_button.dart';
import 'package:silesua/components/my_text_field.dart';
import 'package:silesua/services/auth/auth_services.dart';

class Login extends StatefulWidget {
  final void Function()? ontap;
  const Login({super.key, this.ontap});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  signUp() async {
    final authService = Provider.of<AuthServices>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailcontroller.text, passwordcontroller.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  //logo if nedded
                  const Icon(
                    Icons.login,
                    size: 100.0,
                    color: Colors.black,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //welcome text
                  const Text(
                    "Hey Good to see you again!",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //sub welcome
                  const Text(
                    "You have been Missed!!",
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  //input fields 1
                  MyTextField(
                    hintText: "Enter your Email",
                    controllers: emailcontroller,
                    obscureText: false,
                    leftIcon: Icons.mail,
                    iconColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //input fields 2
                  MyTextField(
                    hintText: "Enter your Password",
                    controllers: passwordcontroller,
                    obscureText: true,
                    leftIcon: Icons.lock,
                    rightIcon: Icons.password,
                    iconColor: Colors.grey,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text("Forget Password?", style: TextStyle(
                        color: Color.fromARGB(255, 158, 43, 187),
                      ),),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //log in button
                  MyButton(
                    text: "Login",
                    ontap: signUp,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  //dont have an account button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Dont have an account ",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: widget.ontap,
                        child: const Text(
                          "Register Now!",
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(255, 158, 43, 187),
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
