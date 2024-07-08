import 'package:flutter/material.dart';

import 'register view widgets/register_view_body.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[400],
      body: const RegisterViewBody(),
    );
  }
}
