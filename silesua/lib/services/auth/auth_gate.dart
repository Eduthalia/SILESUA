import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:silesua/main.dart';
//import 'package:silesua/pages/consultants.dart';
//import 'package:silesua/pages/home_page_main.dart';
//import 'package:silesua/pages/home_screen.dart';
import 'package:silesua/services/auth/login_or_register.dart';
import 'package:silesua/services/routes.dart';

//import '../../pages/home_page.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return  const MainScreen();
            } else {
              return const LoginOrRegister();
            }
          }),
    );
  }
}
