import 'package:flutter/material.dart';

import 'login view widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: const LoginViewBody(),
    );
  }
}
