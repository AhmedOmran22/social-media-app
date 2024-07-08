import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:the_wall/views/home%20view/home_view.dart';
import 'package:the_wall/views/login%20view/login_view.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // user logged in
          if (snapshot.hasData) {
            return const HomeView();
          } else {
            return const LoginView();
          }
        },
      ),
    );
  }
}
