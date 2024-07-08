import 'package:flutter/material.dart';

import 'register_form.dart';


class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: RegisterForm(),
    );
  }
}
