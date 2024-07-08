import 'package:flutter/material.dart';

import 'login_form.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: LoginForm(),
    );
  }
}
